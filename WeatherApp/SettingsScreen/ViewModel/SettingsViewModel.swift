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
    let dbHelper: DbHelperProtocol
    let repository: RepositoryProtocol
    let viewRefreshCitiesTableData = PublishSubject<Bool>()
    let viewMarkCityAsCurrent = PublishSubject<Int>()
    let setupCheckViews = PublishSubject<Bool>()
    let viewMarkUnitAsCurrent = PublishSubject<Int>()
    let viewCloseScreen = PublishSubject<Bool>() //TODO
    var viewShowLoader = PublishSubject<Bool>() //TODO
    private var citySelected = PublishSubject<Int>()
    private let getCities = PublishSubject<Bool>()
    var clickedItem: Int = 0
    
    init(scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), dbHelper: DbHelperProtocol, settingsDataDelegate: SettingsDataDelegate, repository: RepositoryProtocol) {
        self.scheduler = scheduler
        self.repository = repository
        self.dbHelper = dbHelper
        self.settingsDelegate = settingsDataDelegate
        self.data = SettingsDataModel(cities: [], cityToShow: 0, units: settingsDataDelegate.units, weatherParameters: settingsDataDelegate.settings)
    }
    
    func initGetCities() -> Disposable{
        return getCities.flatMap({[unowned self] _ -> Observable<[Geoname]> in
            return self.dbHelper.getGeonamesFromDb()
            }).subscribeOn(scheduler)
                .observeOn(MainScheduler.init())
                .subscribe(onNext: {[unowned self] geonames in
                    self.data.cities = geonames
                    self.viewRefreshCitiesTableData.onNext(true)
                })
    }
    
    func initCitySelected() -> Disposable{
        return citySelected.flatMap({[unowned self] index -> Observable<Response> in
            self.clickedItem = index
            self.viewShowLoader.onNext(true)
            let coordinates = self.data.cities[index].lat + "," + self.data.cities[index].lng
            return self.repository.getWeather(endpoint: Endpoint.getWeatherEndpoint(coordinates: coordinates, units: self.data.units.rawValue))
        }).subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] response in
                self.viewShowLoader.onNext(false)
                self.settingsDelegate.receaveData(weather: response, city: self.data.cities[self.clickedItem])
                self.viewCloseScreen.onNext(true)
            })
    }
    
    func cityClicked(onIndex: Int){
        citySelected.onNext(onIndex)
    }
    
    func getCitiesFromDb(){
        getCities.onNext(true)
    }
    
    func applyChangesAndClose(){
        settingsDelegate.setNewSettings(settingsDataModel: self.data)
        viewCloseScreen.onNext(true)
    }
    
    func clickedHumidityButtonCheck(){
        self.data.weatherParameters.humidity = !self.data.weatherParameters.humidity
        print("clickedHumidity: \(self.data.weatherParameters.humidity)")
        self.setupCheckViews.onNext(true)
    }
    
    func clickedPressureButtonCheck(){
        self.data.weatherParameters.pressure = !self.data.weatherParameters.pressure
        self.setupCheckViews.onNext(true)
    }
    
    func clickedWindButtonCheck(){
        self.data.weatherParameters.windSpeed = !self.data.weatherParameters.windSpeed
        self.setupCheckViews.onNext(true)
    }
    
}
