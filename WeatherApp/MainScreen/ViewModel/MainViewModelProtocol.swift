//
//  MainViewModelProtocol.swift
//  AvazBa
//
//  Created by Valentin Šarić on 16/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol MainViewModelProtocol{
    func initGetingDataFromRepository() -> Disposable
    func initialDataRequest()
    var tempUnit: String!{get}
    var windSpeedUnit: String!{get}
    var cityName: String{get}
    var viewShowLoader: PublishSubject<Bool>{get}
    var viewLoadWithData: PublishSubject<MainDataModel>{get}
    var viewSetBackgroundImages: PublishSubject<(icon: String, gradientInfo: Condition?)>{get}
}
