//
//  SettingsDataModel.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

struct SettingsDataModel {
    let cities: [Cities]
    let units: UnitsType
    var conditions: [String: Bool] = ["humidity": true, "windSpeed": true, "pressure": true]
}
