//
//  SearchScreenTests.swift
//  WeatherAppTests
//
//  Created by Valentin Šarić on 30/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Cuckoo
import Quick
import RxTest
import RxSwift
import Nimble
@testable import WeatherApp

class SearchScreenTests: QuickSpec {
    
    override func spec() {
        let testBundle = Bundle.init(for: SearchScreenTests.self)
        let supplyListUrl = testBundle.url(forResource: "search_screen_response", withExtension: "json")!
        let supplyListData = try! Data(contentsOf: supplyListUrl)
        let supplyCitiesResponse: Cities? =
        {
            do{
                let response = try JSONDecoder().decode(Cities.self, from: supplyListData)
                return response
            }catch{
                return nil
            }
            
        }()
        
        let testBundleMain = Bundle.init(for: SearchScreenTests.self)
        let supplyListUrlMain = testBundleMain.url(forResource: "main_screen_response", withExtension: "json")!
        let supplyListDataMain = try! Data(contentsOf: supplyListUrlMain)
        let supplyWeatherResponse: Response? =
        {
            do{
                let response = try JSONDecoder().decode(Response.self, from: supplyListDataMain)
                return response
            }catch{
                return nil
            }
            
        }()
        
        var searchViewModel: SearchViewModel!
        let disposeBag = DisposeBag()
        afterSuite {
            searchViewModel = nil
        }
        describe("SearchViewModel initialization"){
            context("Initionalized correctly"){
                beforeEach {
                    let mockRepository = MockRepositoryProtocol()
                    let testScheduler = TestScheduler(initialClock: 0)
                    searchViewModel = SearchViewModel(repository: mockRepository, scheduler: testScheduler)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("is not nil"){
                    expect(searchViewModel).toNot(be(nil))
                }
                it("data is nil"){
                    expect(searchViewModel.data).to(be([]))
                }
            }
            context("text in textfield is changed"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subscriber = testScheduler.createObserver(String.self)
                var mockRepository = MockRepositoryProtocol()
                beforeEach {
                    mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyWeatherResponse!)))
                    }
                    stub(mockRepository) { mock in
                        when(mock.getCities(endpoint: any()).thenReturn(Observable.just(supplyCitiesResponse!)))
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subscriber = testScheduler.createObserver(String.self)
                    searchViewModel = SearchViewModel(repository: mockRepository, scheduler: testScheduler)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("requst is not sent for empty string"){
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    searchViewModel.dynamicSearchString.onNext("")
                    verify(mockRepository, times(0)).getCities(endpoint: any())
                }
                it("requst is sent for nonempty string"){
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    searchViewModel.dynamicSearchString.onNext("da")
                    verify(mockRepository, times(2)).getCities(endpoint: any())
                }
                it("sends request for weather when user tap tableViewCell"){
                    searchViewModel.dynamicSearchString.onNext("da")
                    searchViewModel.citySelected(index: 1).disposed(by: disposeBag)
                    verify(mockRepository).getWeather(endpoint: any())
                }
            }
        }
        
        describe("Loader logic"){
            context("when sending request"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subscriber = testScheduler.createObserver(Bool.self)
                beforeEach {
                    let mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyWeatherResponse!)))
                    }
                    stub(mockRepository) { mock in
                        when(mock.getCities(endpoint: any()).thenReturn(Observable.just(supplyCitiesResponse!)))
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subscriber = testScheduler.createObserver(Bool.self)
                    searchViewModel = SearchViewModel(repository: mockRepository, scheduler: testScheduler)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    searchViewModel.viewShowLoader.subscribe(subscriber).disposed(by: disposeBag)
                    testScheduler.start()
                    
                }
                it("loader is shown on start of request"){
                    searchViewModel.dynamicSearchString.onNext("pl")
                    searchViewModel.citySelected(index: 1).disposed(by: disposeBag)
                    expect(subscriber.events.first!.value.element).to(equal(true))
                }
                it("loader is hiden after receiving data"){
                    searchViewModel.dynamicSearchString.onNext("pleter")
                    searchViewModel.citySelected(index: 1).disposed(by: disposeBag)
                    //???????????????????????????????????????????????????????????? there is just one event on publish subject
                    //for showing and hideing loader, hideing of loader "wasnt trigered when testing, while on real app run it is trigered.
                    expect(subscriber.events.last!.value.element).to(equal(false))
                }
            }
        }
    }
}

