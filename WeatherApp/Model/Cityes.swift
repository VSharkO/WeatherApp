//
//  City.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 29/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

struct Cityes: Codable {
    let totalResultsCount: Int
    let geonames: [Geoname]
}

struct Geoname: Codable {
    let lng: String
    let geonameId: Int
    let toponymName, countryId, fcl: String
    let population: Int
    let countryCode, name, fclName: String
    let countryName, fcodeName, adminName1, lat: String
    let fcode: String
}

