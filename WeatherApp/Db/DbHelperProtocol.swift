//
//  DbHelperProtocol.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol DbHelperProtocol {
    func saveGeonameToDb(geoname: Geoname)
    func getGeonamesFromDb() -> Observable<[Geoname]>
    func deleteGeonameFromDb(geoname: Geoname)
}
