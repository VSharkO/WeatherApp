//
//  DbHelper.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class DbHelper{
    
    let realm = try? Realm()
    
    func saveGeonameToDb(geoname: City){
        guard let realm = realm else{return}
        var isContained = false
        let geonameForDb = DbGeoname(name: geoname.name, lng: geoname.lng, ltd: geoname.lat, countryCode: geoname.countryCode ?? "")
        let dbGeonames = realm.objects(DbGeoname.self)
        
        if !dbGeonames.filter({$0.lng == geonameForDb.lng && $0.ltd == geonameForDb.ltd}).isEmpty{
            isContained = true
        }
        if !isContained{
            try? realm.write {
                realm.add(geonameForDb)
            }
        }
    }
    
    func getGeonamesFromDb() -> Observable<[City]>{
        guard let realm = realm else{return Observable.just([])}
        let dbGeonames = realm.objects(DbGeoname.self)
        var geonames: [City] = []
        dbGeonames.forEach{geonames.append(City(lng: $0.lng, countryCode: $0.countryCode, name: $0.name, lat: $0.ltd))}
        return Observable.just(geonames)
        }
    
    func deleteGeonameFromDb(geoname: City){
        guard let realm = realm else{return}
        if let name = realm.objects(DbGeoname.self).filter({$0.name == geoname.name}).first{
            try? realm.write {
                realm.delete(name)
            }
        }
    }
}
