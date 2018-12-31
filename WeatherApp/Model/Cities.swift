//
//  City.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 29/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RealmSwift

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

class DbGeoname: Object{
    @objc dynamic var lng: String = ""
    @objc dynamic var ltd: String = ""
    @objc dynamic var countryCode: String?
    @objc dynamic var name: String = ""
    
    convenience init(name: String, lng: String, ltd: String,countryCode: String) {
        self.init()
        self.lng = lng
        self.ltd = ltd
        self.countryCode = countryCode
        self.name = name
    }
    
}

