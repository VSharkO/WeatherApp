//
//  MainViewModelDelegate.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate {
    func receaveData(weather: WeatherResponse, city: City)
    var units: UnitsType{get}
}
