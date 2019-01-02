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
    var viewShowLoader = PublishSubject<Bool>()
    var viewRefreshTableViewData = PublishSubject<Bool>()
    var dynamicSearchString = PublishSubject<String>()
    private var citySelected = PublishSubject<Int>()
    var data: [Geoname] = []
    var dbHelper: DbHelperProtocol!
    var clickedItem = -1
    
    init(repository: RepositoryProtocol, scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), dbHelper: DbHelperProtocol) {
        self.repository = repository
        self.scheduler = scheduler
        self.dbHelper = dbHelper
    }
    
    func initGetingDataFromRepository() -> Disposable {
        return dynamicSearchString.flatMap({[unowned self] dynamicString -> Observable<Cities> in
            guard !dynamicString.isEmpty else{return Observable.just(Cities(geonames: []))}
            return self.repository.getCities(endpoint: Endpoint.getCitiesEndpoint(startingWith: dynamicString))
        }).subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] cities in
                self.data = cities.geonames
                self.viewRefreshTableViewData.onNext(true)
            })
    }
    
    func initCitySelected() -> Disposable{
            return citySelected.flatMap({[unowned self] index -> Observable<Response> in
                self.clickedItem = index
                self.viewShowLoader.onNext(true)
                let coordinates = self.data[index].lat + "," + self.data[index].lng
                return self.repository.getWeather(endpoint: Endpoint.getWeatherEndpoint(coordinates: coordinates, units: Constants.siUnitsApi)).subscribeOn(self.scheduler)
            }).subscribeOn(scheduler)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: {[unowned self] response in
                    self.viewShowLoader.onNext(false)
                    self.dbHelper.saveGeonameToDb(geoname: self.data[ self.clickedItem])
                    self.searchCoordinatorDelegate.closeScreenWithData(weather: response, city: self.data[ self.clickedItem])
                })
        }
    
    func cityClicked(onIndex: Int){
        citySelected.onNext(onIndex)
    }
    
    func searchForText(text: String) {
         dynamicSearchString.onNext(text)
    }
}
