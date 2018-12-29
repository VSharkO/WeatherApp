//
//  CitiesInteractor.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 29/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol CitiesInteractor{
    func getCitiesFromEndpoint(endpoint: Endpoint) -> Observable<Cities>
}

extension CitiesInteractor{
    func getCitiesFromEndpoint(endpoint: Endpoint) -> Observable<Cities>{
        return NetworkHelper.getDataFromApi(with: endpoint)
    }
}
