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
    var cityToShow: Geoname
    let scheduler: SchedulerType
    let dbHelper: DbHelperProtocol
    let viewMarkCityAsCurrent = PublishSubject<Int>()
    let viewMarkUnitAsCurrent = PublishSubject<Int>()
    let viewCloseScreen = PublishSubject<Bool>()
    private let getCities = PublishSubject<Bool>()
    
    init(scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), dbHelper: DbHelperProtocol, settingsDataDelegate: SettingsDataDelegate) {
        self.scheduler = scheduler
        self.dbHelper = dbHelper
        self.settingsDelegate = settingsDataDelegate
        self.cityToShow = settingsDataDelegate.city
        self.data = SettingsDataModel(cities: [], cityToShow: 0, units: settingsDataDelegate.units, weatherParameters: settingsDataDelegate.settings)
    }
    
    func initGetCities() -> Disposable{
        return getCities.flatMap({[unowned self] _ -> Observable<[Geoname]> in
            return self.dbHelper.getGeonamesFromDb()
            }).subscribeOn(scheduler)
                .observeOn(MainScheduler.init())
                .subscribe(onNext: {[unowned self] geonames in
                    self.data.cities = geonames
                })
    }
    
    func getCitiesFromDb(){
        getCities.onNext(true)
    }
    
    func setCityToShowInDataModel(){
        if data.cities.count > 0{
            let index = data.cities.firstIndex(where: { $0.getCoordinates() == cityToShow.getCoordinates() })
            self.data.cityToShow = index ?? 0
        }
    }
    
    func clickedOnCity(index: Int){
        self.data.cityToShow = index
    }
    
    func applyChangesAndClose(){
//        self.data.weatherParameters.windSpeed = false
//        self.data.cityToShow = 4
//        self.data.units = .us
        settingsDelegate.setNewSettings(settingsDataModel: self.data)
        viewCloseScreen.onNext(true)
    }
    
}
