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
    func getMinTemperature() -> String
    func getMaxTemperature() -> String
    var viewShowLoader: PublishSubject<Bool>{get}
    var viewLoadWithData: PublishSubject<Currently>{get}
    var viewSetBackgroundImages: PublishSubject<(icon: String, gradientInfo: Condition?)>{get}
    
}
