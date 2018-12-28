//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class SearchViewModel : SearchViewModelProtocol{
    let repository: RepositoryProtocol
    let scheduler : SchedulerType
    var dynamicSearchString = PublishSubject<String>()
    
    init(repository: RepositoryProtocol, scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)) {
        self.repository = repository
        self.scheduler = scheduler
    }
    
    func initGetingDataFromRepository() -> Disposable {
//            return dataRequestTriger.flatMap({ [unowned self] _ -> Observable<Response> in
//                self.viewShowLoader.onNext(true)
//                return self.repository.getWeather(endpoint: Endpoint.getWeatherEndpoint(coordinates: self.coordinates, units: Constants.siUnitsApi))
//            }).subscribeOn(scheduler)
//                .observeOn(MainScheduler.instance)
//                .subscribe(onNext: {[unowned self] response in
//                    self.setData(response: response)
//                    self.setUnits()
//                    self.updateView()
//                })
//        }
        return dynamicSearchString
            .subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { dynamicText in
                    print(dynamicText)
        })
    }
}
