//
//  Interactor.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 18/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol WeatherInteractor{
    func getWeatherFromEndpoint(endpoint: Endpoint) -> Observable<WeatherResponse>
}

extension WeatherInteractor{
    func getWeatherFromEndpoint(endpoint: Endpoint) -> Observable<WeatherResponse>{
        return NetworkHelper.getDataFromApi(with: endpoint)
    }
}
