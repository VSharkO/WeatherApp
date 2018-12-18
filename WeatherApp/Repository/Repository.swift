//
//  Repository.swift
//  AvazBa
//
//  Created by Valentin Šarić on 18/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class Repository : RepositoryProtocol,WeatherInteractor{
    
    func getWeather(endpoint: Endpoint) -> Observable<Response> {
        return getWeatherFromEndpoint(endpoint: endpoint)
    }
}

