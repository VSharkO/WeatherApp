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
@testable import WeatherApp

class SettingsScreenTests: QuickSpec {
    
    override func spec() {
        
        var settingsViewModel: SettingsViewModel!
        let disposeBag = DisposeBag()
        afterSuite {
            settingsViewModel = nil
        }
        describe("SearchViewModel initialization"){
            context("Initionalized correctly"){
                beforeEach {
                    let testScheduler = TestScheduler(initialClock: 0)
                    settingsViewModel = SettingsViewModel(scheduler: testScheduler)
                    testScheduler.start()
                }
                it("is not nil"){
                    expect(settingsViewModel).toNot(be(nil))
                }
                it("data is nil"){
                    expect(settingsViewModel.data).to(be(nil))
                }
                
            }
        }
    }
            
}
