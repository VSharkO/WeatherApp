//
//  SearchViewModelProtocol.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchViewModelProtocol {
    var data: [City]{get}
    var dynamicTextPublisher: PublishSubject<String>{get}
    var viewRefreshTableViewData: PublishSubject<Bool>{get}
    var viewCloseScreen: PublishSubject<Bool>{get}
    var viewShowLoader: PublishSubject<Bool>{get}
    func initGetingCities() -> Disposable
    func initCitySelected() -> Disposable
    func cityClicked(onIndex: Int)
}
