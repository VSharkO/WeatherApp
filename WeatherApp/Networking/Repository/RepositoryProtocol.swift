//
//  RepositoryProtocol.swift
//  AvazBa
//
//  Created by Valentin Šarić on 16/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol RepositoryProtocol{
    func getWeather(endpoint: Endpoint) -> Observable<Response>
    func getCities(endpoint: Endpoint) -> Observable<Cities>
    func saveGeonameToDb(geoname: Geoname)
    func getGeonamesFromDb() -> Observable<[Geoname]>
    func deleteGeonameFromDb(geoname: Geoname)
}
