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
    let viewRefreshCitiesTableData = PublishSubject<Bool>()
    let viewMarkCityAsCurrent = PublishSubject<Int>()
    let viewMarkUnitAsCurrent = PublishSubject<Int>()
    let viewCloseScreen = PublishSubject<Bool>()
    private let getCities = PublishSubject<Bool>()
    
    init(scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background), dbHelper: DbHelperProtocol, settingsDataDelegate: SettingsDataDelegate) {
        self.scheduler = scheduler
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
    
    func getCitiesFromDb(){
        getCities.onNext(true)
    }
    
    func clickedOnCity(index: Int){
        self.data.cityToShow = index
    }
    
    func applyChangesAndClose(){
        settingsDelegate.setNewSettings(settingsDataModel: self.data)
        viewCloseScreen.onNext(true)
    }
    
}
