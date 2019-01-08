//
//  RepositoryProtocol.swift
//  AvazBa
//
//  Created by Valentin Šarić on 16/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol CitiesRepositoryProtocol{
    func getCities(endpoint: Endpoint) -> Observable<Cities>
    func saveCityToDb(geoname: City)
    func getCitiesFromDb() -> Observable<[City]>
    func deleteCityFromDb(geoname: City)
}
