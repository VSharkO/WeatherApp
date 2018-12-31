//
//  Units.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

enum UnitsType: String{
    case us = "us"
    case si = "si"
}

struct WeatherUnits {
    let temperatureUnit: String
    let windSpeedUnit: String
}
