//
//  TimeDiferenceHelperTests.swift
//  WeatherAppTests
//
//  Created by Valentin Šarić on 19/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import Cuckoo
import Quick
import RxTest
import RxSwift
import Nimble
@testable import WeatherApp

class TimeDiferenceHelperTests: QuickSpec {
    
    override func spec() {
        describe("TimeDiferenceHelper object"){
            context("called function for chacking is diference less then 1 day"){
                it("is false when diference is 25h"){
                    expect(TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds:1000000000, toSeconds:1000090000)).to(equal(false))
                }
                it("is false when diference is 25h (diferent order of parameters)"){
                    expect(TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds:1000090000, toSeconds:1000000000)).to(equal(false))
                }
                it("is false when diference is 24h and 1 sec"){
                    expect(TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds:1000000000, toSeconds:1000086401)).to(equal(false))
                }
                it("is false when diference is 24h"){
                    expect(TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds:1000000000, toSeconds:1000086400)).to(equal(false))
                }
                it("is true when diference is 23h and 59min and 59sec"){
                    expect(TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds:1000000000, toSeconds:1000086399)).to(equal(true))
                }
            }
        }
    }
            
}
