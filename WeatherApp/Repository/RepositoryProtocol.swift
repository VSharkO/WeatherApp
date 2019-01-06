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
    func getWeather(endpoint: Endpoint) -> Observable<WeatherResponse>
    func getCities(endpoint: Endpoint) -> Observable<Cities>
    func saveCityToDb(geoname: City)
    func getCityFromDb() -> Observable<[City]>
    func deleteCityFromDb(geoname: City)
}
