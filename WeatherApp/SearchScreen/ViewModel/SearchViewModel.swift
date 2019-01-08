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
    let weatherRepository: WeatherRepositoryProtocol
    let citiesRepository: CitiesRepositoryProtocol
    let scheduler : SchedulerType
    var viewShowLoader = PublishSubject<Bool>()
    var viewRefreshTableViewData = PublishSubject<Bool>()
    var viewCloseScreen = PublishSubject<Bool>()
    var dynamicTextPublisher = PublishSubject<String>()
    private var units: UnitsType
    private var citySelected = PublishSubject<Int>()
    internal var data: [City] = []
    private var clickedItem = -1
    
    init(weatherRepository: WeatherRepositoryProtocol, citiesRepository: CitiesRepositoryProtocol , scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), mainViewModelDelegate: MainViewModelDelegate) {
        self.weatherRepository = weatherRepository
        self.citiesRepository = citiesRepository
        self.scheduler = scheduler
        self.units = mainViewModelDelegate.units
        self.mainViewModelDelegate = mainViewModelDelegate
    }
    
    func initGetingDataFromRepository() -> Disposable {
        return dynamicTextPublisher.flatMap({[unowned self] dynamicString -> Observable<Cities> in
            guard !dynamicString.isEmpty else{return Observable.just(Cities(geonames: []))}
            return self.citiesRepository.getCities(startingWith: dynamicString)
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
                return self.weatherRepository.getWeather(coordinates: self.data[index].getCoordinates(), units: self.units)
            }).subscribeOn(scheduler)
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: {[unowned self] response in
                    self.citiesRepository.saveCityToDb(geoname: self.data[self.clickedItem])
                    self.mainViewModelDelegate.receaveData(weather: response, city: self.data[self.clickedItem])
                    self.viewShowLoader.onNext(false)
                    self.viewCloseScreen.onNext(true)
                    
                })
    }
    
    func searchForText(text: String) {
         dynamicTextPublisher.onNext(text)
    }
    
    func cityClicked(onIndex: Int){
        citySelected.onNext(onIndex)
    }

}
