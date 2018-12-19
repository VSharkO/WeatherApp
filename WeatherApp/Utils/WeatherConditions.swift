//
//  GradientHelper.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 19/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

enum Conditions: String, CaseIterable{
    case night = "night"
    case day = "day"
    case fog = "fog"
    case snow = "snow"
    case rain = "rain"
}

class WeatherConditionsHelper{
    public static func returnConditionThatStringContains(for string: String) -> String?{
        var gradient: String? = nil
        Conditions.allCases.forEach{
            if string.contains($0.rawValue){
                gradient = $0.rawValue
            }
        }
        return gradient
    }
}
