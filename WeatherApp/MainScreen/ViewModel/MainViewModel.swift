//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 18/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel : MainViewModelProtocol,MainViewModelDelegate,SettingsDataDelegate{
    
    internal var data: MainDataModel!
    internal var units: UnitsType
    internal var weatherUnits: WeatherUnits!
    internal var settings = WeatherParametersToShow(humidity: true, windSpeed: true, pressure: true)
    internal var city: City!
    
    private let weatherRepository: WeatherRepositoryProtocol
    private let scheduler : SchedulerType
    private var dataRequestTriger = ReplaySubject<Bool>.create(bufferSize: 1)
    internal var viewShowLoader = PublishSubject<Bool>()
    internal var viewSetBackgroundImages = PublishSubject<(icon: String, gradientInfo: Condition?)>()
    internal var viewLoadWithData = PublishSubject<MainDataModel>()
    internal var viewSetupSettings = PublishSubject<WeatherParametersToShow>()
    
    init(repository: WeatherRepositoryProtocol, scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)) {
        self.weatherRepository = repository
        self.scheduler = scheduler
        units = .si
        self.city = City(lng: Constants.defaultCityLng, countryCode: Constants.defaultCountryCode, name: Constants.defaultCityName, lat: Constants.defaultCityLat)
    }
    
    func initGetingDataFromApi() -> Disposable {
        return dataRequestTriger.flatMap({ [unowned self] _ -> Observable<WeatherResponse> in
            self.viewShowLoader.onNext(true)
            return self.weatherRepository.getWeather(coordinates: self.city.getCoordinates(), units: self.units)
        }).subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] weatherResponse in
                self.setData(response: weatherResponse)
                self.updateView()
                self.viewShowLoader.onNext(false)
            })
    }
    
    func initialDataRequest(){
        dataRequestTrigered()
    }
    
    func receaveData(weather: WeatherResponse, city: City) {
        setData(response: weather)
        self.city = city
        updateView()
    }
    
    func setNewSettings(settingsDataModel: SettingsDataModel) {
        self.units = settingsDataModel.units
        setUnits()
        self.settings = settingsDataModel.weatherParameters
        self.updateView()
    }
    
    private func setData(response: WeatherResponse){
        let currently = response.currently
        let gradientInfo = WeatherConditionsHelper.returnConditionThatStringContains(for: currently.icon)
        if let daily = response.daily.data.last(where: {
            TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds: currently.time, toSeconds: $0.time)
        }){
            self.data = MainDataModel(currently: currently, daily: daily, conditions: gradientInfo)
        }else{
            print("Error setting data, response doesnt contain daily")
        }
        self.setUnits()
    }
    
    private func updateView(){
        self.viewSetBackgroundImages.onNext((icon: data.currently.icon,gradientInfo: data.conditions))
        self.viewLoadWithData.onNext(data)
        self.viewSetupSettings.onNext(self.settings)
    }
    
    private func dataRequestTrigered(){
        dataRequestTriger.onNext(true)
    }
    
    private func setUnits(){
        self.weatherUnits = UnitsHelper.getUnits(units: self.units)
    }
    
}
