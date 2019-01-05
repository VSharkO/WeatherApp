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
    let repository: RepositoryProtocol
    let viewRefreshCitiesTableData = PublishSubject<Bool>()
    let setupCheckViews = PublishSubject<Bool>()
    let viewReloadUnitsTableData = PublishSubject<Bool>()
    let viewCloseScreen = PublishSubject<Bool>()
    var viewShowLoader = PublishSubject<Bool>()
    private var citySelected = PublishSubject<Int>()
    var clickedItem: Int = 0
    
    init(scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), settingsDataDelegate: SettingsDataDelegate, repository: RepositoryProtocol) {
        self.scheduler = scheduler
        self.repository = repository
        self.settingsDelegate = settingsDataDelegate
        self.data = SettingsDataModel(cities: [], units: settingsDataDelegate.units, weatherParameters: settingsDataDelegate.settings)
        self.data.cities = settingsDataDelegate.citiesFromDb
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
                self.settingsDelegate.receaveData(weather: response, city: self.data.cities[self.clickedItem])
                self.viewCloseScreen.onNext(true)
            })
    }
    
    func cityClicked(onIndex: Int){
        settingsDelegate.setNewSettings(settingsDataModel: self.data)
        citySelected.onNext(onIndex)
    }
    
    func applyChangesAndClose(){
        settingsDelegate.setNewSettings(settingsDataModel: self.data)
        if let selectedCity = data.cities.firstIndex(where: {
            $0.name == self.settingsDelegate.city.name}){
            self.citySelected.onNext(selectedCity)
        }
        else{
            self.viewCloseScreen.onNext(true)
        }
    }
    
    func clickedHumidityButtonCheck(){
        self.data.weatherParameters.humidity = !self.data.weatherParameters.humidity
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
    
    func deleteCity(index: Int){
        self.data.cities.remove(at: index)
        settingsDelegate.deleteCityFromDb(index: index)
    }
    
    func unitsClicked(withIndex: Int) {
        let units = UnitsHelper.getUnitsFromIndex(index: withIndex)
        self.data.units = units
        self.viewReloadUnitsTableData.onNext(true)
    }
    
}
