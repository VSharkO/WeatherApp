//
//  City.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 29/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

struct Cities: Codable {
    let geonames: [Geoname]
}

struct Geoname: Codable {
    let lng: String
    let countryCode: String?
    let name: String
    let lat: String
}

extension Geoname{
    func getCoordinates() -> String{
        return lng + "," + lat
    }
}
