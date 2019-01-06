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
    
    func getWeather(endpoint: Endpoint) -> Observable<WeatherResponse> {
        return getWeatherFromEndpoint(endpoint: endpoint)
    }
    
    func saveCityToDb(geoname: City) {
        dbHelper.saveGeonameToDb(geoname: geoname)
    }
    
    func getCitiesFromDb() -> Observable<[City]> {
        return dbHelper.getGeonamesFromDb()
    }
    
    func deleteCityFromDb(geoname: City) {
        dbHelper.deleteGeonameFromDb(geoname: geoname)
    }
    
}

