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
    var data: SettingsDataModel!
    let scheduler: SchedulerType!
    let dbHelper: DbHelper!
    let settingsDelegate: SettingsDataDelegate!
    //TODO: testni subject
    var closeScreen = PublishSubject<Bool>()
    
    init(scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background),dbHelper: DbHelper, settingsDataDelegate: SettingsDataDelegate) {
        self.scheduler = scheduler
        self.dbHelper = dbHelper
        self.settingsDelegate = settingsDataDelegate
        self.data = SettingsDataModel(cityToShow: 0, cities: [], units: settingsDelegate.units, weatherParameters: settingsDelegate.settings)
    }
    
    func getCities() -> Disposable{
        return dbHelper.getGeonamesFromDb().subscribe(onNext: { geonames in
                self.data.cities = geonames
            self.messWithData() //TODO: testno
        })
    }
   
    // TODO: Ovo je samo testno
    func messWithData(){
        self.data.weatherParameters.pressure = false
        self.data.cityToShow = 2
        self.data.units = .us
        settingsDelegate.setNewSettings(settingsDataModel: self.data)
        self.closeScreen.onNext(true)
    }
    
    
}
