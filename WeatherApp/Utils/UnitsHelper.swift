//
//  Units.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

class UnitsHelper{
    static func getUnits(units: UnitsType) -> WeatherUnits{
        if units == .si{
            let weatherUnits = WeatherUnits.init(temperatureUnit: Constants.tempUnitSi, windSpeedUnit: Constants.windSpeedUnitSi)
            return weatherUnits
        }else{
            let weatherUnits = WeatherUnits.init(temperatureUnit: Constants.tempUnitUs, windSpeedUnit: Constants.windSpeedUnitUs)
            return weatherUnits
        }
    }
}

