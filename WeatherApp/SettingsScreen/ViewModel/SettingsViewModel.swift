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
    var data: SettingsDataModel
    let scheduler: SchedulerType
    let dbHelper: DbHelperProtocol
    let settingsDelegate: SettingsDataDelegate
    let getCities = PublishSubject<Bool>()
    
    init(scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), dbHelper: DbHelperProtocol, settingsDataDelegate: SettingsDataDelegate) {
        self.scheduler = scheduler
        self.dbHelper = dbHelper
        self.settingsDelegate = settingsDataDelegate
        self.data = SettingsDataModel(cityToShow: 0, cities: [], units: settingsDelegate.units, weatherParameters: settingsDelegate.settings)
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
}
