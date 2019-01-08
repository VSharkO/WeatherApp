//
//  SettingsViewModel.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 30/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class SettingsViewModel: SettingsViewModelProtocol{
    
    var settingsDelegate: SettingsDataDelegate
    var data: SettingsDataModel
    let scheduler: SchedulerType
    let weatherRepository: WeatherRepositoryProtocol
    let citiesRepository: CitiesRepositoryProtocol
    let viewRefreshCitiesTableData = PublishSubject<Bool>()
    let viewSetupCheckViews = PublishSubject<Bool>()
    let viewReloadUnitsTableData = PublishSubject<Bool>()
    let viewCloseScreen = PublishSubject<Bool>()
    var viewShowLoader = PublishSubject<Bool>()
    var sendRequestForCity = PublishSubject<City>()
    private let getCitiesFromDb = PublishSubject<Bool>()
    
    init(scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), settingsDataDelegate: SettingsDataDelegate, weatherRepository: WeatherRepositoryProtocol, citiesRepository: CitiesRepositoryProtocol) {
        self.scheduler = scheduler
        self.weatherRepository = weatherRepository
         self.citiesRepository = citiesRepository
        self.settingsDelegate = settingsDataDelegate
        self.data = SettingsDataModel(cities: [], units: settingsDataDelegate.units, weatherParameters: settingsDataDelegate.settings, cityToShow: settingsDataDelegate.city)
    }
    
    func initRequestForCity() -> Disposable{
        return sendRequestForCity.flatMap({[unowned self] city -> Observable<WeatherResponse> in
            self.data.cityToShow = city
            self.viewShowLoader.onNext(true)
            return self.weatherRepository.getWeather(coordinates: city.getCoordinates(), units: self.data.units)
        }).subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] response in
                self.settingsDelegate.receaveData(weather: response, city: self.data.cityToShow)
                self.viewShowLoader.onNext(false)
                self.viewCloseScreen.onNext(true)
            })
    }
    
    func initGetCitiesFromDb() -> Disposable{
        return getCitiesFromDb.flatMap({[unowned self] _ -> Observable<[City]> in
            self.viewShowLoader.onNext(true)
            return self.citiesRepository.getCitiesFromDb()
        }).subscribeOn(scheduler)
            .observeOn(MainScheduler.init())
            .subscribe(onNext: {[unowned self] geonames in
                self.viewShowLoader.onNext(false)
                self.data.cities = geonames
            })
    }
    
    func cityClicked(onIndex: Int){
        self.data.cityToShow = self.data.cities[onIndex]
        settingsDelegate.setNewSettings(settingsDataModel: self.data)
        sendRequestForCity.onNext(self.data.cityToShow)
    }
    
    func clickedHumidityButtonCheck(){
        self.data.weatherParameters.humidity = !self.data.weatherParameters.humidity
        self.viewSetupCheckViews.onNext(true)
    }
    
    func clickedPressureButtonCheck(){
        self.data.weatherParameters.pressure = !self.data.weatherParameters.pressure
        self.viewSetupCheckViews.onNext(true)
    }
    
    func clickedWindButtonCheck(){
        self.data.weatherParameters.windSpeed = !self.data.weatherParameters.windSpeed
        self.viewSetupCheckViews.onNext(true)
    }
    
    func trigerGetCitiesFromDb() {
        self.getCitiesFromDb.onNext(true)
    }
    
    func deleteCityFromDb(index: Int) {
        self.citiesRepository.deleteCityFromDb(geoname: data.cities[index])
        trigerGetCitiesFromDb()
    }
    
    func unitsClicked(withIndex: Int) {
        let units = UnitsHelper.getUnitsFromIndex(index: withIndex)
        self.data.units = units
        self.viewReloadUnitsTableData.onNext(true)
    }
    
    func applyChangesAndClose(){
        settingsDelegate.setNewSettings(settingsDataModel: self.data)
        self.sendRequestForCity.onNext(self.data.cityToShow)
    }
    
}
