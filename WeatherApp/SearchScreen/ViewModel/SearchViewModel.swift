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
    var viewShowLoader = PublishSubject<Bool>()
    var viewRefreshTableViewData = PublishSubject<Bool>()
    var data: [Geoname] = []
    var dbHelper: DbHelperProtocol!
    
    init(repository: RepositoryProtocol, scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)) {
        self.repository = repository
        self.scheduler = scheduler
        dbHelper = DbHelper()
    }
    
    func initGetingDataFromRepository() -> Disposable {
        return dynamicSearchString.flatMap({[unowned self] dynamicString -> Observable<Cities> in
            guard !dynamicString.isEmpty else{return Observable.just(Cities(geonames: []))}
            return self.repository.getCities(endpoint: Endpoint.getCitiesEndpoint(startingWith: dynamicString))
        }).subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] cities in
                self.data = cities.geonames
                self.viewRefreshTableViewData.onNext(true)
            })
    }
    
    func citySelected(index: Int) -> Disposable{
        let coordinates = data[index].lat + "," + data[index].lng
        self.viewShowLoader.onNext(true)
        return self.repository.getWeather(endpoint: Endpoint.getWeatherEndpoint(coordinates: coordinates, units: Constants.siUnitsApi)).subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] response in
                self.viewShowLoader.onNext(false)
                self.dbHelper.saveGeonameToDb(geoname: self.data[index])
                self.searchCoordinatorDelegate.closeScreenWithData(weather: response, city: self.data[index])
            })
    }
}
