//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class SearchViewModel: SearchViewModelProtocol{
    
    var searchCoordinatorDelegate: SearchCoordinatorDelegate!
    let repository: RepositoryProtocol
    let scheduler : SchedulerType
    var dynamicSearchString = PublishSubject<String>()
    var viewRefreshTableViewData = PublishSubject<Bool>()
    var data: [Geoname] = []
    
    init(repository: RepositoryProtocol, scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)) {
        self.repository = repository
        self.scheduler = scheduler
    }
    
    func initGetingDataFromRepository() -> Disposable {
        return dynamicSearchString.flatMap({[unowned self] dynamicString -> Observable<Cities> in
            return self.repository.getCities(endpoint: Endpoint.getCitiesEndpoint(startingWith: dynamicString))
            }).subscribeOn(MainScheduler.instance)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { cities in
                    self.data = cities.geonames
                    self.viewRefreshTableViewData.onNext(true)
                })
        }
    
    func citySelected(index: Int) -> Disposable{
        let coordinates = data[index].lat + "," + data[index].lng
        return self.repository.getWeather(endpoint: Endpoint.getWeatherEndpoint(coordinates: coordinates, units: Constants.siUnitsApi)).subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] response in
                self.searchCoordinatorDelegate.closeScreenWithData(weather: response, city: self.data[index])
            })
    }
}
