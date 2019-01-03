//
//  MainViewModelProtocol.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 18/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol MainViewModelProtocol{
    func initGetingDataFromRepository() -> Disposable
    func initialDataRequest()
    var weatherUnits: WeatherUnits! {get}
    var city: Geoname!{get}
    var viewShowLoader: PublishSubject<Bool>{get}
    var viewLoadWithData: PublishSubject<MainDataModel>{get}
    var viewSetBackgroundImages: PublishSubject<(icon: String, gradientInfo: Condition?)>{get}
    var viewSetupSettings: PublishSubject<WeatherParametersToShow>{get}
}
