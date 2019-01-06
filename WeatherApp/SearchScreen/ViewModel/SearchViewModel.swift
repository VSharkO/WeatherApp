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
    
    var mainViewModelDelegate: MainViewModelDelegate
    let repository: RepositoryProtocol
    let scheduler : SchedulerType
    var viewShowLoader = PublishSubject<Bool>()
    var viewRefreshTableViewData = PublishSubject<Bool>()
    var viewCloseScreen = PublishSubject<Bool>()
    var dynamicSearchString = PublishSubject<String>()
    private var units: UnitsType
    private var citySelected = PublishSubject<Int>()
    internal var data: [City] = []
    private var clickedItem = -1
    
    init(repository: RepositoryProtocol, scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), mainViewModelDelegate: MainViewModelDelegate) {
        self.repository = repository
        self.scheduler = scheduler
        self.units = mainViewModelDelegate.units
        self.mainViewModelDelegate = mainViewModelDelegate
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
            return citySelected.flatMapLatest({[unowned self] index -> Observable<WeatherResponse> in
                self.clickedItem = index
                self.viewShowLoader.onNext(true)
                let coordinates = self.data[index].lat + "," + self.data[index].lng
                return self.repository.getWeather(endpoint: Endpoint.getWeatherEndpoint(coordinates: coordinates, units: self.units.rawValue))
            }).subscribeOn(scheduler)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: {[unowned self] response in
                    self.repository.saveCityToDb(geoname: self.data[self.clickedItem])
                    self.mainViewModelDelegate.receaveData(weather: response, city: self.data[self.clickedItem])
                    self.viewShowLoader.onNext(false)
                    self.viewCloseScreen.onNext(true)
                    
                })
    }
    
    func cityClicked(onIndex: Int){
        citySelected.onNext(onIndex)
    }
    
    func searchForText(text: String) {
         dynamicSearchString.onNext(text)
    }

}
