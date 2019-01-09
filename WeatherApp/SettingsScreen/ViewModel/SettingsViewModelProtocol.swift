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
    var viewCloseScreen: PublishSubject<Bool>{get}
    var viewRefreshCitiesTableData: PublishSubject<Bool>{get}
    var viewShowLoader: PublishSubject<Bool>{get}
    var viewReloadUnitsTableData: PublishSubject<Bool>{get}
    var viewSetupCheckViews: PublishSubject<Bool>{get}
    func initRequestForCity() -> Disposable
    func initGetCities() -> Disposable
    func cityClicked(onIndex: Int)
    func clickedHumidityButtonCheck()
    func clickedPressureButtonCheck()
    func clickedWindButtonCheck()
    func unitsClicked(withIndex: Int)
    func applyChangesAndClose()
    func deleteCityFromDb(index: Int)
    func trigerGetCitiesFromDb()
}
