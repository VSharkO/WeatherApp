//
//  Interactor.swift
//  NewsApp
//
//  Created by Valentin Šarić on 23/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol WeatherInteractor{
    func getWeatherFromEndpoint(endpoint: Endpoint) -> Observable<Response>
}

extension WeatherInteractor{
    func getWeatherFromEndpoint(endpoint: Endpoint) -> Observable<Response>{
        return NetworkHelper.getDataFromApi(with: endpoint)
    }
}
