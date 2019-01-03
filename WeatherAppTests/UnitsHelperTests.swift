//
//  UnitsHelperTests.swift
//  WeatherAppTests
//
//  Created by Valentin Šarić on 03/01/2019.
//  Copyright © 2019 Valentin Šarić. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import WeatherApp

class UnitsHelperTests: QuickSpec {
    
    override func spec() {
        describe("UnitsHelperObject"){
            context("unitsHelper given si units"){
                it("return proper string for si units"){
                    expect(UnitsHelper.getUnits(units: .si).temperatureUnit).to(equal("C"))
                    expect(UnitsHelper.getUnits(units: .si).windSpeedUnit).to(equal(" mph"))
                }
                it("return proper string for us units"){
                    expect(UnitsHelper.getUnits(units: .us).temperatureUnit).to(equal("F"))
                    expect(UnitsHelper.getUnits(units: .us).windSpeedUnit).to(equal(" mps"))
                }
            }
        }
    }
    
}
