//
//  SettingsViewModelProtocol.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 30/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol SettingsViewModelProtocol {
    var data: SettingsDataModel{get}
    func initGetCities() -> Disposable
    func getCitiesFromDb()
    var viewCloseScreen: PublishSubject<Bool>{get}
    var viewRefreshCitiesTableData: PublishSubject<Bool>{get}
}
