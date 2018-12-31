//
//  SettingsDataModel.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RealmSwift

struct SettingsDataModel {
    let cities: [Cities]
    let units: UnitsType
    var weatherParameters: WeatherParametersToShow
}
