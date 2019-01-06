//
//  Repository.swift
//  AvazBa
//
//  Created by Valentin Šarić on 18/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class Repository : RepositoryProtocol,WeatherInteractor,CitiesInteractor{
    
    let dbHelper = DbHelper()
    
    func getCities(endpoint: Endpoint) -> Observable<Cities> {
        return getCitiesFromEndpoint(endpoint: endpoint)
    }
    
    func getWeather(endpoint: Endpoint) -> Observable<Response> {
        return getWeatherFromEndpoint(endpoint: endpoint)
    }
    
    func saveGeonameToDb(geoname: Geoname) {
        dbHelper.saveGeonameToDb(geoname: geoname)
    }
    
    func getGeonamesFromDb() -> Observable<[Geoname]> {
        return dbHelper.getGeonamesFromDb()
    }
    
    func deleteGeonameFromDb(geoname: Geoname) {
        dbHelper.deleteGeonameFromDb(geoname: geoname)
    }
    
}

