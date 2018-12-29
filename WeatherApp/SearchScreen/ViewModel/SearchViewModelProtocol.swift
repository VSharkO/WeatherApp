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
    var data: [Geoname]{get}
    var searchCoordinatorDelegate: SearchCoordinatorDelegate!{get}
    var dynamicSearchString: PublishSubject<String>{get}
    var viewRefreshTableViewData: PublishSubject<Bool>{get}
    func initGetingDataFromRepository() -> Disposable
    func citySelected(index: Int)
}
