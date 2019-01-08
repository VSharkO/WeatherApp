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
    var weatherUnits: WeatherUnits! {get}
    var city: City!{get}
    var viewShowLoader: PublishSubject<Bool>{get}
    var viewLoadWithData: PublishSubject<MainDataModel>{get}
    var viewSetBackgroundImages: PublishSubject<(icon: String, gradientInfo: Condition?)>{get}
    var viewSetupSettings: PublishSubject<WeatherParametersToShow>{get}
    func initGetingDataFromApi() -> Disposable
    func initialDataRequest()
}
