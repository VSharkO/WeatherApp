//
//  WeatherRepositoryProtocol.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 08/01/2019.
//  Copyright © 2019 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol WeatherRepositoryProtocol {
    func getWeather(coordinates: String, units: UnitsType) -> Observable<WeatherResponse>
}
