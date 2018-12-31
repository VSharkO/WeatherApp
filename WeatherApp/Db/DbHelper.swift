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

class DbHelper : DbHelperProtocol{
    let realm = try! Realm()
    
    func saveGeonameToDb(geoname: Geoname){
        let dbGeoname = DbGeoname(name: geoname.name, lng: geoname.lng, ltd: geoname.lat, countryCode: geoname.countryCode ?? "")
        
        guard !realm.objects(DbGeoname.self).contains(dbGeoname) else{
            return
        }
        try! realm.write {
            realm.add(dbGeoname)
        }
    }
    
    func getGeonamesFromDb() -> Observable<[Geoname]>{
        let dbGeonames = realm.objects(DbGeoname.self)
        var geonames: [Geoname] = []
        dbGeonames.forEach{geonames.append(Geoname(lng: $0.lng, countryCode: $0.countryCode, name: $0.name, lat: $0.ltd))}
        return Observable.just(geonames)
        }
    
    func deleteGeonameFromDb(geoname: Geoname){
        if let name = realm.objects(DbGeoname.self).filter({$0.name == geoname.name}).first{
            try! realm.write {
                realm.delete(name)
            }
        }
    }
    
}
