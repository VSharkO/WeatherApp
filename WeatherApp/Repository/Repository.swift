//
//  Repository.swift
//  AvazBa
//
//  Created by Valentin Šarić on 18/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class Repository : RepositoryProtocol,WeatherInteractor, CitiesInteractor{
    
    func getCities(endpoint: Endpoint) -> Observable<Cities> {
        return getCitiesFromEndpoint(endpoint: endpoint)
    }
    
    
    func getWeather(endpoint: Endpoint) -> Observable<Response> {
        return getWeatherFromEndpoint(endpoint: endpoint)
    }
}

