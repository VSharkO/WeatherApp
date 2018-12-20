//
//  WeatherConditionsHelperTests.swift
//  WeatherAppTests
//
//  Created by Valentin Šarić on 19/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import WeatherApp

class WeatherConditionsHelperTests: QuickSpec {
    
    override func spec() {
        describe("WeatherConditionsHelper object"){
            context("called function that returns condition whitch given string contains"){
                it("is returning fog"){
                    expect(WeatherConditionsHelper.returnConditionThatStringContains(for: "nešto-nešto-fog")).to(equal(Condition.fog.rawValue))
                }
                
                it("is returning snow"){
                    expect(WeatherConditionsHelper.returnConditionThatStringContains(for: "sdaflgjkboliq23b498hiujbsnowdjfkngjhrbgj")).to(equal(Condition.snow.rawValue))
                }
                
                it("is returning nil"){
                    expect(WeatherConditionsHelper.returnConditionThatStringContains(for: "sdaflgjkboliq23b498hiujbswdjfkngjhrbgj")).to(beNil())
                }
                
                it("is returning night"){
                    expect(WeatherConditionsHelper.returnConditionThatStringContains(for: "asdfa-asdf95956nightasdasdg")).to(equal(Condition.night.rawValue))
                }
            }
        }
    }
    
}
