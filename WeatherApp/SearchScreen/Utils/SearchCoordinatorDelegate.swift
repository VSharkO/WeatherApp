//
//  Utils.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 29/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

protocol SearchCoordinatorDelegate: CoordinatorDelegate {
    func closeScreenWithData(weather: Response, city: Geoname)
}
