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

class SearchViewModelTests: QuickSpec {
    
    override func spec() {
        let testBundle = Bundle.init(for: SearchViewModelTests.self)
        let supplyListUrl = testBundle.url(forResource: "search_screen_response", withExtension: "json")!
        let supplyListData = try! Data(contentsOf: supplyListUrl)
        let supplyCitiesResponse: Cities =
        {
            do{
                let response = try JSONDecoder().decode(Cities.self, from: supplyListData)
                return response
            }catch{
                return Cities(geonames: [])
            }
            
        }()
        
        let testBundleMain = Bundle.init(for: SearchViewModelTests.self)
        let supplyListUrlMain = testBundleMain.url(forResource: "main_screen_response", withExtension: "json")!
        let supplyListDataMain = try! Data(contentsOf: supplyListUrlMain)
        let supplyWeatherResponse: WeatherResponse =
        {
            do{
                let response = try JSONDecoder().decode(WeatherResponse.self, from: supplyListDataMain)
                return response
            }catch{
                return WeatherResponse(latitude: 0, longitude: 0, timezone: "", currently: Currently.init(time: 0, summary: "", icon: "", temperature: 0, humidity: 0, pressure: 0, windSpeed: 0), daily: Daily.init(summary: "", icon: "", data: []), offset: 0)
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
                    let mockMainViewModelDelegate = MockMainViewModelDelegate()
                    let testScheduler = TestScheduler(initialClock: 0)
                    stub(mockMainViewModelDelegate) { mock in
                        when(mock.units).get.thenReturn(.si)
                        when(mock.receaveData(weather: any(), city: any()).thenDoNothing())
                        
                    }
                    searchViewModel = SearchViewModel(repository: mockRepository, scheduler: testScheduler, mainViewModelDelegate: mockMainViewModelDelegate)
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
                var mockRepository = MockRepositoryProtocol()
                let mockMainViewModelDelegate = MockMainViewModelDelegate()
                beforeEach {
                    mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getCities(endpoint: any()).thenReturn(Observable.just(supplyCitiesResponse)))
                    }
                    stub(mockMainViewModelDelegate) { mock in
                        when(mock.units).get.thenReturn(.si)
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    searchViewModel = SearchViewModel.init(repository: mockRepository, scheduler: testScheduler, mainViewModelDelegate: mockMainViewModelDelegate)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    searchViewModel.initCitySelected().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("requst is not sent for empty string"){
                    searchViewModel.dynamicSearchString.onNext("")
                    verify(mockRepository, times(0)).getCities(endpoint: any())
                }
                it("requst is sent for nonempty string"){
                    searchViewModel.dynamicSearchString.onNext("ple")
                    verify(mockRepository).getCities(endpoint: any())
                }
            }
                context("user clikced on city in tableview"){
                    var testScheduler = TestScheduler(initialClock: 0)
                    var mockRepository = MockRepositoryProtocol()
                    var subscriber = testScheduler.createObserver(Bool.self)
                    let mockMainViewModelDelegate = MockMainViewModelDelegate()
                    beforeEach {
                        mockRepository = MockRepositoryProtocol()
                        stub(mockRepository) { mock in
                            when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyWeatherResponse)))
                            when(mock.getCities(endpoint: any()).thenReturn(Observable.just(supplyCitiesResponse)))
                            when(mock.saveCityToDb(geoname: any()).thenDoNothing())
                        }
                        stub(mockMainViewModelDelegate) { mock in
                            when(mock.receaveData(weather: any(), city: any()).thenDoNothing())
                            when(mock.units).get.thenReturn(.si)
                        }
                        testScheduler = TestScheduler(initialClock: 0)
                        let subscriber = testScheduler.createObserver(Bool.self)
                        searchViewModel = SearchViewModel.init(repository: mockRepository, scheduler: testScheduler, mainViewModelDelegate: mockMainViewModelDelegate)
                        searchViewModel.viewCloseScreen.subscribe(subscriber).disposed(by: disposeBag)
                        searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                        searchViewModel.initCitySelected().disposed(by: disposeBag)
                        testScheduler.start()
                    }
                it("sends weather request for tapped city "){
                    searchViewModel.dynamicSearchString.onNext("ple")
                    searchViewModel.cityClicked(onIndex: 1)
                    verify(mockRepository).getWeather(endpoint: any())
                }
                it("when response is received, save city to db"){
                    searchViewModel.dynamicSearchString.onNext("ple")
                    searchViewModel.cityClicked(onIndex: 1)
                    verify(mockRepository).saveCityToDb(geoname: any())
                }
                it("sends city and weather data to mainViewModel"){
                    verify(mockMainViewModelDelegate, times(2)).receaveData(weather: any(), city: any())
                }
                    
//                it("close screen in the end"){
//                    searchViewModel.dynamicSearchString.onNext("ple")
//                    searchViewModel.cityClicked(onIndex: 1)
//                    expect(subscriber.events.last?.value.element).to(equal(true))
//                }
            }
        }
        
        describe("Loader logic"){
            context("when sending request"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subscriber = testScheduler.createObserver(Bool.self)
                var mockRepository = MockRepositoryProtocol()
                let mockMainViewModelDelegate = MockMainViewModelDelegate()
                beforeEach {
                    mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyWeatherResponse)))
                        when(mock.getCities(endpoint: any()).thenReturn(Observable.just(supplyCitiesResponse)))
                        when(mock.saveCityToDb(geoname: any()).thenDoNothing())
                    }
                    stub(mockMainViewModelDelegate) { mock in
                        when(mock.receaveData(weather: any(), city: any()).thenDoNothing())
                        when(mock.units).get.thenReturn(.si)
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subscriber = testScheduler.createObserver(Bool.self)
                    searchViewModel = SearchViewModel(repository: mockRepository, scheduler: testScheduler, mainViewModelDelegate: mockMainViewModelDelegate)
                    searchViewModel.viewShowLoader.subscribe(subscriber).disposed(by: disposeBag)
                    searchViewModel.initCitySelected().disposed(by: disposeBag)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    testScheduler.start()
                }
                
                it("loader is shown on start of request"){
                    searchViewModel.dynamicSearchString.onNext("pl")
                    searchViewModel.cityClicked(onIndex: 1)
                    expect(subscriber.events.first!.value.element).to(equal(true))
                }
                
                it("loader is hiden after receiving data"){
                    searchViewModel.dynamicSearchString.onNext("p")
                    searchViewModel.cityClicked(onIndex: 1)
                    expect(subscriber.events.last!.value.element).to(equal(false))
                }
            }
        }
    }
}

