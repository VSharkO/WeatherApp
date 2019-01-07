//
//  SettingsScreenTests.swift
//  WeatherAppTests
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//
import Foundation
import Cuckoo
import Quick
import RxTest
import RxSwift
import Nimble
import RealmSwift
@testable import WeatherApp

class SettingsViewModelTests: QuickSpec {
    
    override func spec() {
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
        var settingsViewModel: SettingsViewModel!
        let disposeBag = DisposeBag()
        afterSuite {
            settingsViewModel = nil
        }
        describe("SettingsViewModel initialization"){
            context("Initionalized correctly"){
                var testScheduler = TestScheduler(initialClock: 0)
                let mockSettingsDataDelegate = MockSettingsDataDelegate()
                let mockRepositoryProtocl = MockRepositoryProtocol()
                let city = City(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")
                let weatherParameters = WeatherParametersToShow(humidity: true, windSpeed: false, pressure: true)
                beforeEach {
                    stub(mockSettingsDataDelegate) { mock in
                        when(mock.setNewSettings(settingsDataModel: any())).thenDoNothing()
                        when(mock.city.get.thenReturn(city))
                        when(mock.units.get.thenReturn(.si))
                        when(mock.settings.get.thenReturn(weatherParameters))
                        when(mock.citiesFromDb.get.thenReturn([city]))
                    }
                    let testScheduler = TestScheduler(initialClock: 0)
                    settingsViewModel = SettingsViewModel.init(scheduler: testScheduler, settingsDataDelegate: mockSettingsDataDelegate, repository: mockRepositoryProtocl)
                    settingsViewModel.initRequestForCity()
                    testScheduler.start()
                }
                it("is not nil"){
                    expect(settingsViewModel).toNot(beNil())
                }
                it("data is not nil"){
                    expect(settingsViewModel.data).toNot(beNil())
                }
                it("data is set to default"){
                    expect(settingsViewModel.data.units).to(equal(mockSettingsDataDelegate.units))
                    expect(settingsViewModel.data.weatherParameters.humidity).to(equal(mockSettingsDataDelegate.settings.humidity))
                    expect(settingsViewModel.data.weatherParameters.pressure).to(equal(mockSettingsDataDelegate.settings.pressure))
                    expect(settingsViewModel.data.weatherParameters.windSpeed).to(equal(mockSettingsDataDelegate.settings.windSpeed))
                    expect(settingsViewModel.data.cities.count).to(equal(1))
                }
            }
        }
        
        describe("SettingsViewModel logic on user interaction"){
            context("User click on Location"){
                var testScheduler = TestScheduler(initialClock: 0)
                var subsriber = testScheduler.createObserver(City.self)
                var subsriber2 = testScheduler.createObserver(Bool.self)
                let mockSettingsDataDelegate = MockSettingsDataDelegate()
                let mockRepositoryProtocl = MockRepositoryProtocol()
                let city = City(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")
                let weatherParameters = WeatherParametersToShow(humidity: true, windSpeed: false, pressure: true)
                beforeEach {
                    stub(mockSettingsDataDelegate) { mock in
                        when(mock.setNewSettings(settingsDataModel: any())).thenDoNothing()
                        when(mock.city.get.thenReturn(city))
                        when(mock.units.get.thenReturn(.si))
                        when(mock.settings.get.thenReturn(weatherParameters))
                        when(mock.citiesFromDb.get.thenReturn([city]))
                        when(mock.deleteCityFromDb(index: any())).thenDoNothing()
                        when(mock.receaveData(weather: any(), city: any())).thenDoNothing()
                    }
                    stub(mockRepositoryProtocl) { mock in
                        when(mock.getWeather(endpoint: any()).thenReturn(Observable.just(supplyListResponse!)))
                    }
                    testScheduler = TestScheduler(initialClock: 0)
                    subsriber = testScheduler.createObserver(City.self)
                    subsriber2 = testScheduler.createObserver(Bool.self)
                    settingsViewModel = SettingsViewModel.init(scheduler: testScheduler, settingsDataDelegate: mockSettingsDataDelegate, repository: mockRepositoryProtocl)
                    settingsViewModel.initRequestForCity().disposed(by: disposeBag)
                    settingsViewModel.sendRequestForCity.subscribe(subsriber).disposed(by: disposeBag)
                    settingsViewModel.viewCloseScreen.subscribe(subsriber2).disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("sends weatherRequest when city is selected and close screen"){
                    settingsViewModel.cityClicked(onIndex: 0)
                    expect(subsriber.events.first?.value.element?.name).to(equal("Pleternica"))
                    expect(subsriber2.events.first?.value.element).to(equal(true))
                    
                }
                it("delete city from data and called method in delegate to delete city when user click to do that"){
                    expect(settingsViewModel.data.cities.count).to(equal(1))
                    settingsViewModel.deleteCity(index: 0)
                    expect(settingsViewModel.data.cities.count).to(equal(0))
                    verify(mockSettingsDataDelegate).deleteCityFromDb(index: 0)
                }
                it("call metod to set new settings in mainViewModel and close screen when done button is clicked"){
                    settingsViewModel.applyChangesAndClose()
                    verify(mockSettingsDataDelegate, times(2)).setNewSettings(settingsDataModel: any()) //first time when city clicked and second when applyChanges is called.
                    
                }
                
            }
        }
    }
    
}
