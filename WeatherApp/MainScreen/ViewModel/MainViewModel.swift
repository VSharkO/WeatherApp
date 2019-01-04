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
    internal var city: Geoname!
    internal var settings = WeatherParametersToShow(humidity: true, windSpeed: true, pressure: true)
    
    let repository: RepositoryProtocol
    let scheduler : SchedulerType
    var dataRequestTriger = ReplaySubject<Bool>.create(bufferSize: 1)
    var viewShowLoader = PublishSubject<Bool>()
    var viewSetBackgroundImages = PublishSubject<(icon: String, gradientInfo: Condition?)>()
    var viewLoadWithData = PublishSubject<MainDataModel>()
    var viewSetupSettings = PublishSubject<WeatherParametersToShow>()
    
    init(repository: RepositoryProtocol, scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)) {
        self.repository = repository
        self.scheduler = scheduler
        units = .si
        self.city = Geoname(lng: Constants.defaultCityLng, countryCode: Constants.defaultCountryCode, name: Constants.defaultCityName, lat: Constants.defaultCityLat)
    }
    
    func initGetingDataFromRepository() -> Disposable {
        return dataRequestTriger.flatMap({ [unowned self] _ -> Observable<Response> in
            self.viewShowLoader.onNext(true)
            return self.repository.getWeather(endpoint: Endpoint.getWeatherEndpoint(coordinates: self.city.getCoordinates(), units: self.units.rawValue))
        }).subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] response in
                self.setData(response: response)
                self.setUnits()
                self.updateView()
            })
    }
    
    func setData(response: Response){
        let currently = response.currently
        let gradientInfo = WeatherConditionsHelper.returnConditionThatStringContains(for: currently.icon)
        if let daily = response.daily.data.last(where: { dailyData -> Bool in
            TimeDiferenceHelper.isTimeDiferenceInADay(fromSeconds: currently.time, toSeconds: dailyData.time)
        }){
            self.data = MainDataModel(currently: currently, daily: daily, conditions: gradientInfo)
        }else{
            print("Error setting data, response doesnt contain daily")
        }
    }
    
    func updateView(){
        self.viewSetBackgroundImages.onNext((icon: data.currently.icon,gradientInfo: data.conditions))
        self.viewLoadWithData.onNext(data)
        self.viewSetupSettings.onNext(self.settings)
        self.viewShowLoader.onNext(false)
    }
    
    func initialDataRequest(){
        dataRequestTrigered()
    }
    
    func receaveData(weather: Response, city: Geoname) {
        setData(response: weather)
        self.city = city
        updateView()
    }
    
    func setNewSettings(settingsDataModel: SettingsDataModel) {
        self.units = settingsDataModel.units
        self.settings = settingsDataModel.weatherParameters
        self.updateView()
    }
    
    private func dataRequestTrigered(){
        dataRequestTriger.onNext(true)
    }
    
    private func setUnits(){
        self.weatherUnits = UnitsHelper.getUnits(units: self.units)
    }
    
}
