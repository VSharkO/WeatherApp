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

        var settingsViewModel: SettingsViewModel!
        let disposeBag = DisposeBag()
        afterSuite {
            settingsViewModel = nil
        }
        describe("SearchViewModel initialization"){
            context("Initionalized correctly"){
                let mockSettingsDataDelegate = MockSettingsDataDelegate()
                let mockDbHelperProtocol = MockDbHelperProtocol()
                beforeEach {
                    stub(mockSettingsDataDelegate) { mock in
                        when(mock.setNewSettings(settingsDataModel: any())).thenDoNothing()
                        when(mock.city.get.thenReturn(Geoname(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")))
                        when(mock.units.get.thenReturn(.si))
                        when(mock.settings.get.thenReturn(WeatherParametersToShow(humidity: true, windSpeed: false, pressure: true)))
                    }
                    stub(mockDbHelperProtocol) { mock in
                        let geoname = Geoname(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")
                        let geoname1 = Geoname(lng: "20", countryCode: nil, name: "Osijek", lat: "30")
                        when(mock.getGeonamesFromDb()).thenReturn(Observable.just([geoname,geoname1]))
                    }
                    let testScheduler = TestScheduler(initialClock: 0)
                    settingsViewModel = SettingsViewModel(scheduler: testScheduler, dbHelper: mockDbHelperProtocol, settingsDataDelegate: mockSettingsDataDelegate)
                    settingsViewModel.initGetCities().disposed(by: disposeBag)
                    testScheduler.start()
                }
                it("is not nil"){
                    expect(settingsViewModel).toNot(be(nil))
                }
                it("data is not nil"){
                    expect(settingsViewModel.data).toNot(beNil())
                }
                it("data is set to default"){
                    expect(settingsViewModel.data.units).to(equal(mockSettingsDataDelegate.units))
                    expect(settingsViewModel.data.weatherParameters.humidity).to(equal(mockSettingsDataDelegate.settings.humidity))
                    expect(settingsViewModel.data.weatherParameters.pressure).to(equal(mockSettingsDataDelegate.settings.pressure))
                    expect(settingsViewModel.data.weatherParameters.windSpeed).to(equal(mockSettingsDataDelegate.settings.windSpeed))
                    expect(settingsViewModel.data.cityToShow).to(equal(0))
                    expect(settingsViewModel.data.cities.count).to(equal(0))
                }
                it("gettingCitiesFromDb is triggered"){
                    settingsViewModel.getCitiesFromDb()
                    verify(mockDbHelperProtocol).getGeonamesFromDb()
                }
                it("data has cities from db after calling function to do that"){
                    settingsViewModel.getCitiesFromDb()
                    expect(settingsViewModel.data.cities.count).to(equal(2))
                }
            }
        }
        describe("SearchViewModel changeing settings logic"){
            context("User click on Location"){
                let mockSettingsDataDelegate = MockSettingsDataDelegate()
                let mockDbHelperProtocol = MockDbHelperProtocol()
                beforeEach {
                    stub(mockSettingsDataDelegate) { mock in
                        when(mock.setNewSettings(settingsDataModel: any())).thenDoNothing()
                        when(mock.city.get.thenReturn(Geoname(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")))
                        when(mock.units.get.thenReturn(.si))
                        when(mock.settings.get.thenReturn(WeatherParametersToShow(humidity: true, windSpeed: false, pressure: true)))
                    }
                    stub(mockDbHelperProtocol) { mock in
                        let geoname = Geoname(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")
                        let geoname1 = Geoname(lng: "20", countryCode: nil, name: "Osijek", lat: "30")
                        when(mock.getGeonamesFromDb()).thenReturn(Observable.just([geoname,geoname1]))
                    }
                    let testScheduler = TestScheduler(initialClock: 0)
                    settingsViewModel = SettingsViewModel(scheduler: testScheduler, dbHelper: mockDbHelperProtocol, settingsDataDelegate: mockSettingsDataDelegate)
                    settingsViewModel.initGetCities().disposed(by: disposeBag)
                    settingsViewModel.getCitiesFromDb()
                    testScheduler.start()
                }
                it("becomes location to show weather for"){
                    
                }
                
            }
        }
    }
    
}
