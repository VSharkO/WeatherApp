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
                var mockCitiesRepositoryProtocol = MockCitiesRepositoryProtocol()
                var mockWeatherRepositoryProtocol = MockWeatherRepositoryProtocol()
                var mockMainViewModelDelegate = MockMainViewModelDelegate()
                var testScheduler = TestScheduler(initialClock: 0)
                beforeEach {
                    mockMainViewModelDelegate = MockMainViewModelDelegate()
                    mockCitiesRepositoryProtocol = MockCitiesRepositoryProtocol()
                    mockWeatherRepositoryProtocol = MockWeatherRepositoryProtocol()
                    stub(mockMainViewModelDelegate) { mock in
                        when(mock.units.get.thenReturn(.si, .si))
                    }
                    stub(mockCitiesRepositoryProtocol) { mock in
                        when(mock).getCities(startingWith: any()).thenReturn(Observable.just(supplyCitiesResponse))
                        when(mock).getCitiesFromDb().thenReturn(Observable.just(supplyCitiesResponse.geonames))
                        when(mock).saveCityToDb(geoname: any()).thenDoNothing()
                        when(mock).deleteCityFromDb(geoname: any()).thenDoNothing()
                    }
                    stub(mockWeatherRepositoryProtocol) { mock in
                        when(mock.getWeather(coordinates: any(), units: any()).thenReturn(Observable.just(supplyWeatherResponse)))
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    searchViewModel = SearchViewModel.init(weatherRepository: mockWeatherRepositoryProtocol, citiesRepository: mockCitiesRepositoryProtocol, scheduler: testScheduler, mainViewModelDelegate: mockMainViewModelDelegate)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    searchViewModel.initCitySelected().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("is not nil"){
                    expect(searchViewModel).toNot(be(nil))
                }
                it("data is nil"){
                    expect(searchViewModel.data).to(be([]))
                }
            }
            
        }
        describe("Search logic"){
            context("text in textfield is changed"){
                var mockCitiesRepositoryProtocol = MockCitiesRepositoryProtocol()
                var mockWeatherRepositoryProtocol = MockWeatherRepositoryProtocol()
                var mockMainViewModelDelegate = MockMainViewModelDelegate()
                var testScheduler = TestScheduler(initialClock: 0)
                beforeEach {
                    mockCitiesRepositoryProtocol = MockCitiesRepositoryProtocol()
                    mockWeatherRepositoryProtocol = MockWeatherRepositoryProtocol()
                    mockMainViewModelDelegate = MockMainViewModelDelegate()
                    stub(mockCitiesRepositoryProtocol) { mock in
                        when(mock.getCities(startingWith: any()).thenReturn(Observable.just(supplyCitiesResponse)))
                    }
                    stub(mockMainViewModelDelegate) { mock in
                        when(mock.units.get).thenReturn(.si)
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    searchViewModel = SearchViewModel.init(weatherRepository: mockWeatherRepositoryProtocol, citiesRepository: mockCitiesRepositoryProtocol, scheduler: testScheduler, mainViewModelDelegate: mockMainViewModelDelegate)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    searchViewModel.initCitySelected().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("requst is not sent for empty string"){
                    searchViewModel.dynamicTextPublisher.onNext("")
                    verify(mockCitiesRepositoryProtocol, times(0)).getCities(startingWith: "")
                }
                it("requst is sent for nonempty string"){
                    searchViewModel.dynamicTextPublisher.onNext("ple")
                    verify(mockCitiesRepositoryProtocol).getCities(startingWith: "ple")
                }
            }
            context("user clikced on city in tableview"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subscriber = testScheduler.createObserver(Bool.self)
                var mockCitiesRepositoryProtocol = MockCitiesRepositoryProtocol()
                var mockWeatherRepositoryProtocol = MockWeatherRepositoryProtocol()
                var mockMainViewModelDelegate = MockMainViewModelDelegate()
                beforeEach {
                    mockCitiesRepositoryProtocol = MockCitiesRepositoryProtocol()
                    mockWeatherRepositoryProtocol = MockWeatherRepositoryProtocol()
                    mockMainViewModelDelegate = MockMainViewModelDelegate()
                    stub(mockCitiesRepositoryProtocol) { mock in
                        when(mock.getCities(startingWith: any()).thenReturn(Observable.just(supplyCitiesResponse)))
                        when(mock.saveCityToDb(geoname: any()).thenDoNothing())
                    }
                    stub(mockWeatherRepositoryProtocol) { mock in
                        when(mock.getWeather(coordinates: any(), units: any()).thenReturn(Observable.just(supplyWeatherResponse)))
                    }
                    stub(mockMainViewModelDelegate) { mock in
                        when(mock.receaveData(weather: any(), city: any()).thenDoNothing())
                        when(mock.units).get.thenReturn(.si)
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subscriber = testScheduler.createObserver(Bool.self)
                    searchViewModel = SearchViewModel.init(weatherRepository: mockWeatherRepositoryProtocol, citiesRepository: mockCitiesRepositoryProtocol, scheduler: testScheduler, mainViewModelDelegate: mockMainViewModelDelegate)
                    searchViewModel.viewCloseScreen.subscribe(subscriber).disposed(by: disposeBag)
                    searchViewModel.initCitySelected().disposed(by: disposeBag)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("sends weather request for tapped city "){
                    searchViewModel.searchForText(text: "ple")
                    waitUntil { done in
                        searchViewModel.cityClicked(onIndex: 1)
                        verify(mockWeatherRepositoryProtocol).getWeather(coordinates: any(), units: any())
                        done()
                    }
                    
                }
                it("when response is received, save city to db"){
                    searchViewModel.searchForText(text: "ple")
                    waitUntil { done in
                        searchViewModel.cityClicked(onIndex: 1)
                        verify(mockCitiesRepositoryProtocol, times(1)).saveCityToDb(geoname: any())
                        done()
                    }
                }
                it("sends city and weather data to mainViewModel"){
                    searchViewModel.searchForText(text: "ple")
                    waitUntil { done in
                        searchViewModel.cityClicked(onIndex: 1)
                        verify(mockMainViewModelDelegate, times(1)).receaveData(weather: any(), city: any())
                        done()
                    }
                }
                
                it("close screen in the end"){
                    searchViewModel.searchForText(text: "ple")
                    searchViewModel.cityClicked(onIndex: 1)
                    expect(subscriber.events.last?.value.element).toEventually(equal(true))
                }
            }
        }
        
        describe("Loader logic"){
            context("when sending request"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subscriber = testScheduler.createObserver(Bool.self)
                var mockCitiesRepositoryProtocol = MockCitiesRepositoryProtocol()
                var mockWeatherRepositoryProtocol = MockWeatherRepositoryProtocol()
                var mockMainViewModelDelegate = MockMainViewModelDelegate()
                beforeEach {
                    mockCitiesRepositoryProtocol = MockCitiesRepositoryProtocol()
                    mockWeatherRepositoryProtocol = MockWeatherRepositoryProtocol()
                    mockMainViewModelDelegate = MockMainViewModelDelegate()
                    stub(mockCitiesRepositoryProtocol) { mock in
                        when(mock.getCities(startingWith: any()).thenReturn(Observable.just(supplyCitiesResponse)))
                        when(mock.saveCityToDb(geoname: any()).thenDoNothing())
                    }
                    stub(mockWeatherRepositoryProtocol) { mock in
                        when(mock.getWeather(coordinates: any(), units: any()).thenReturn(Observable.just(supplyWeatherResponse)))
                    }
                    stub(mockMainViewModelDelegate) { mock in
                        when(mock.receaveData(weather: any(), city: any()).thenDoNothing())
                        when(mock.units).get.thenReturn(.si)
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subscriber = testScheduler.createObserver(Bool.self)
                    searchViewModel = SearchViewModel.init(weatherRepository: mockWeatherRepositoryProtocol, citiesRepository: mockCitiesRepositoryProtocol, scheduler: testScheduler, mainViewModelDelegate: mockMainViewModelDelegate)
                    searchViewModel.viewShowLoader.subscribe(subscriber).disposed(by: disposeBag)
                    searchViewModel.initCitySelected().disposed(by: disposeBag)
                    searchViewModel.initGetingDataFromRepository().disposed(by: disposeBag)
                    testScheduler.start()
                }
                
                it("loader is shown on start of request"){
                    searchViewModel.searchForText(text: "pl")
                    searchViewModel.cityClicked(onIndex: 0)
                    expect(subscriber.events.first!.value.element).to(equal(true))
                }
                
                it("loader is hiden after receiving data"){
                    searchViewModel.searchForText(text: "p")
                    searchViewModel.cityClicked(onIndex: 0)
                    expect(subscriber.events.last!.value.element).to(equal(false))
                }
            }
        }
    }
}

