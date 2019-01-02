//
//  SettingsDataDelegate.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

protocol SettingsDataDelegate: MainViewModelDelegate {
    var settings: WeatherParametersToShow{get set}
    var units: UnitsType{get set}
    var city: Geoname!{get set}
}
