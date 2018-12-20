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
    
    var viewShowLoader: PublishSubject<Bool>{get}
    var viewSetBackgroundImages: PublishSubject<(icon: String, gradientInfo: Condition?)>{get}
}
