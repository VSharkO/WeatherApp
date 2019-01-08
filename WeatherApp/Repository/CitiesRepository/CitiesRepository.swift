//
//  Repository.swift
//  AvazBa
//
//  Created by Valentin Šarić on 18/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class CitiesRepository : CitiesRepositoryProtocol{
    
    let dbHelper = DbHelper()
    
    func getCities(startingWith: String) -> Observable<Cities> {
        return NetworkHelper.getDataFromApi(with: Endpoint.getCitiesEndpoint(startingWith: startingWith))
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

