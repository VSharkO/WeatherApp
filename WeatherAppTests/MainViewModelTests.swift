//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Valentin Šarić on 18/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Cuckoo
import Quick
import RxTest
import RxSwift
import Nimble
@testable import WeatherApp

class MainViewModelTests: QuickSpec {
    
    override func spec() {
        let city = City(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")
        let city2 = City(lng: "11", countryCode: "HR", name: "Pleternica", lat: "14")
        let cities = [city,city2]
        let testBundle = Bundle.init(for: MainViewModelTests.self)
        let supplyListUrl = testBundle.url(forResource: "main_screen_response", withExtension: "json")!
        let supplyListData = try! Data(contentsOf: supplyListUrl)
        let supplyListResponse: WeatherResponse? =
        {
            do{
                let response = try JSONDecoder().decode(WeatherResponse.self, from: supplyListData)
                return response
            }catch{
                return nil
            }

        }()

        var mainViewModel: MainViewModel!
        let disposeBag = DisposeBag()
        let weatherParameters = WeatherParametersToShow(humidity: true, windSpeed: false, pressure: true)
        afterSuite {
            mainViewModel = nil
        }
        describe("MainViewModel initialization"){
            context("Initionalized correctly"){
                beforeEach {
                    let mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                        when(mock.getCitiesFromDb().thenReturn(Observable.just(cities)))
                    }
                    let testScheduler = TestScheduler(initialClock: 0)
                    mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                    mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
                    mainViewModel.initGetCitiesFromDb()
                    testScheduler.start()
                }
                it("is not nil"){
                    expect(mainViewModel).toNot(be(nil))
                }
                it("data is nil"){
                    expect(mainViewModel.data).to(beNil())
                }
                it("got cities from db"){
                    mainViewModel.trigerGetCitiesFromDb()
                    expect(mainViewModel.citiesFromDb.count).to(equal(2))
                }
            }
            
            context("Called data from api"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subscriber = testScheduler.createObserver((icon: String, gradientInfo: Condition?).self)
                var mockRepository = MockRepositoryProtocol()
                beforeEach {
                    mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                        when(mock.getCitiesFromDb().thenReturn(Observable.just(cities)))
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subscriber = testScheduler.createObserver((icon: String, gradientInfo: Condition?).self)
                    mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                    mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
                    mainViewModel.viewSetBackgroundImages.subscribe(subscriber).disposed(by: disposeBag)
                    testScheduler.start()
                }
                
                it("requst is sent"){
                    mainViewModel.initialDataRequest()
                    verify(mockRepository).getWeather(endpoint: any())
                }
                it("response is received with correct parameters"){
                    mainViewModel.initialDataRequest()
                    expect(mainViewModel.data.currently.time).to(equal(supplyListResponse?.currently.time))
                    expect(mainViewModel.data.currently.temperature).to(equal(supplyListResponse?.currently.temperature))
                    expect(mainViewModel.data.currently.humidity).to(equal(supplyListResponse?.currently.humidity))
                }
                it("daily variable time is in same day as currently variable time"){
                    mainViewModel.initialDataRequest()
                    expect(TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds: mainViewModel.data.daily.time, toSeconds: mainViewModel.data.currently.time)).to(beTrue())
                }
                it("is seting view background images trigered with correct parameter"){
                        mainViewModel.initialDataRequest()
                    let conditions = WeatherConditionsHelper.returnConditionThatStringContains(for: (supplyListResponse?.currently.icon)!)
                    expect(subscriber.events.first!.value.element!.icon).to(equal(supplyListResponse?.currently.icon))
                    expect(subscriber.events.first!.value.element!.gradientInfo).to(equal(conditions))
                }
            }
            
            context("Data is received from another screen"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subscriber = testScheduler.createObserver((icon: String, gradientInfo: Condition?).self)
                var mockRepository = MockRepositoryProtocol()
                beforeEach {
                    mockRepository = MockRepositoryProtocol()
                    stub(mockRepository) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                        when(mock.getCitiesFromDb().thenReturn(Observable.just(cities)))
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subscriber = testScheduler.createObserver((icon: String, gradientInfo: Condition?).self)
                    mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                    mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
                    mainViewModel.initGetCitiesFromDb()
                    mainViewModel.viewSetBackgroundImages.subscribe(subscriber).disposed(by: disposeBag)
                    testScheduler.start()
                }
                
                it("data is changed correctly and array of cities from db is refreshed"){
                    let city = City(lng: "10", countryCode: "HR", name: "Osijek", lat: "12")
                    mainViewModel.receaveData(weather: supplyListResponse!, city: city)
                    expect(mainViewModel.city.name).to(equal(city.name))
                    expect(mainViewModel.data.currently.summary).to(equal(supplyListResponse!.currently.summary))
                    verify(mockRepository).getCitiesFromDb()
                }
                
            }
            
            describe("MainViewModel initialization"){
                context("Data is received from another screen"){
                    var testScheduler = TestScheduler(initialClock: 0)
                    var subscriber = testScheduler.createObserver((icon: String, gradientInfo: Condition?).self)
                    var mockRepository = MockRepositoryProtocol()
                    beforeEach {
                        mockRepository = MockRepositoryProtocol()
                        stub(mockRepository) { mock in
                            when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                            when(mock.getCitiesFromDb().thenReturn(Observable.just(cities)))
                            when(mock.deleteCityFromDb(geoname: any()).thenDoNothing())
                        }
                        testScheduler = TestScheduler(initialClock: 0)
                        subscriber = testScheduler.createObserver((icon: String, gradientInfo: Condition?).self)
                        mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                        mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
                        mainViewModel.initGetCitiesFromDb()
                        mainViewModel.viewSetBackgroundImages.subscribe(subscriber).disposed(by: disposeBag)
                        testScheduler.start()
                    }
                    
                    it("data is changed correctly and array of cities from db is refreshed"){
                        let city = City(lng: "10", countryCode: "HR", name: "Osijek", lat: "12")
                        mainViewModel.receaveData(weather: supplyListResponse!, city: city)
                        expect(mainViewModel.city.name).to(equal(city.name))
                        expect(mainViewModel.data.currently.summary).to(equal(supplyListResponse!.currently.summary))
                        verify(mockRepository).getCitiesFromDb()
                    }
                    
                    it("On settings change changes weather parameters and units correctly"){
                        mainViewModel.receaveData(weather: supplyListResponse!, city: city)
                        let settingsPassedData = SettingsDataModel(cities: cities, units: .si, weatherParameters: weatherParameters, cityToShow: city)
                        mainViewModel.setNewSettings(settingsDataModel: settingsPassedData)
                        expect(mainViewModel.settings.humidity).to(equal(settingsPassedData.weatherParameters.humidity))
                        expect(mainViewModel.settings.windSpeed).to(equal(settingsPassedData.weatherParameters.windSpeed))
                        expect(mainViewModel.city.name).to(equal(settingsPassedData.cityToShow.name))
                        expect(mainViewModel.units.hashValue).to(equal(settingsPassedData.units.hashValue))
                    }
                    
                    it("Call repository method to delete city from db when needed"){
                        mainViewModel.citiesFromDb = [City(lng: "10", countryCode: "HR", name: "Osijek", lat: "12")]
                        mainViewModel.deleteCityFromDb(index: 0)
                        verify(mockRepository).deleteCityFromDb(geoname: any())
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
                            when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                            when(mock.getCitiesFromDb().thenReturn(Observable.just(cities)))
                        }
                        testScheduler = TestScheduler(initialClock: 0)
                        subscriber = testScheduler.createObserver(Bool.self)
                        mainViewModel = MainViewModel(repository: mockRepository, scheduler: testScheduler)
                        mainViewModel.initGetingDataFromApi().disposed(by: disposeBag)
                        mainViewModel.viewShowLoader.subscribe(subscriber).disposed(by: disposeBag)
                        testScheduler.start()
                        mainViewModel.initialDataRequest()
                    }
                    it("loader is shown on start of request"){
                        expect(subscriber.events.first!.value.element).to(equal(true))
                    }
                    it("loader is hiden after receiving data"){
                        expect(subscriber.events.last!.value.element).to(be(false))
                    }
                }
            }
        }
    }
}
