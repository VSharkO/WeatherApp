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

//        var settingsViewModel: SettingsViewModel!
//        let disposeBag = DisposeBag()
//        afterSuite {
//            settingsViewModel = nil
//        }
//        describe("SearchViewModel initialization"){
//            context("Initionalized correctly"){
//                let mockSettingsDataDelegate = MockSettingsDataDelegate()
//                let mockRepositoryProtocl = MockRepositoryProtocol()
//                beforeEach {
//                    stub(mockSettingsDataDelegate) { mock in
//                        when(mock.setNewSettings(settingsDataModel: any())).thenDoNothing()
//                        when(mock.city.get.thenReturn(Geoname(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")))
//                        when(mock.units.get.thenReturn(.si))
//                        when(mock.settings.get.thenReturn(WeatherParametersToShow(humidity: true, windSpeed: false, pressure: true)))
//                    }
//                    let testScheduler = TestScheduler(initialClock: 0)
//                    testScheduler.start()
//                }
//                it("is not nil"){
//                    expect(settingsViewModel).to(beNil())
//                }
//                it("data is not nil"){
//                    expect(settingsViewModel.data).toNot(beNil())
//                }
//                it("data is set to default"){
//                    expect(settingsViewModel.data.units).to(equal(mockSettingsDataDelegate.units))
//                    expect(settingsViewModel.data.weatherParameters.humidity).to(equal(mockSettingsDataDelegate.settings.humidity))
//                    expect(settingsViewModel.data.weatherParameters.pressure).to(equal(mockSettingsDataDelegate.settings.pressure))
//                    expect(settingsViewModel.data.weatherParameters.windSpeed).to(equal(mockSettingsDataDelegate.settings.windSpeed))
//                    expect(settingsViewModel.data.cities.count).to(equal(0))
//                }
//            }
//        }
//        describe("SearchViewModel changeing settings logic"){
//            context("User click on Location"){
//                let mockSettingsDataDelegate = MockSettingsDataDelegate()
//                 let mockRepositoryProtocl = MockRepositoryProtocol()
//                beforeEach {
//                    stub(mockSettingsDataDelegate) { mock in
//                        when(mock.setNewSettings(settingsDataModel: any())).thenDoNothing()
//                        when(mock.city.get.thenReturn(Geoname(lng: "10", countryCode: nil, name: "Pleternica", lat: "20")))
//                        when(mock.units.get.thenReturn(.si))
//                        when(mock.settings.get.thenReturn(WeatherParametersToShow(humidity: true, windSpeed: false, pressure: true)))
//                    }
//                    let testScheduler = TestScheduler(initialClock: 0)
//                    settingsViewModel = SettingsViewModel(scheduler: testScheduler, settingsDataDelegate: mockSettingsDataDelegate, repository: mockRepositoryProtocl)
//                    settingsViewModel.initRequestForCity().disposed(by: disposeBag)
//                    testScheduler.start()
//                }
//                
//            }
//        }
    }
    
}
