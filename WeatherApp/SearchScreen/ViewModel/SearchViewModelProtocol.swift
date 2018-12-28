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
    var dynamicSearchString: PublishSubject<String>{set get}
    func initGetingDataFromRepository() -> Disposable
}
