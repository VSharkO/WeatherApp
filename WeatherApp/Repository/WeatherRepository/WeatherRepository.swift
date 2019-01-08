//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 08/01/2019.
//  Copyright © 2019 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class WeatherRepository: WeatherRepositoryProtocol{
    func getWeather(endpoint: Endpoint) -> Observable<WeatherResponse> {
        return NetworkHelper.getDataFromApi(with: endpoint)
    }
    
}
