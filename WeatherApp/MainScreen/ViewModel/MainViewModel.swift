//
//  MainViewModel.swift
//  AvazBa
//
//  Created by Valentin Šarić on 16/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel : MainViewModelProtocol{
    
    let repository: RepositoryProtocol
    let scheduler : SchedulerType
    var dataRequestTriger = ReplaySubject<Bool>.create(bufferSize: 1)
    var viewShowLoader = PublishSubject<Bool>()
    var viewSetBackgroundImages = PublishSubject<(icon: String, gradientInfo: String?)>()
    
    var data: MainDataModel!
    
    init(repository: RepositoryProtocol, scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)) {
        self.repository = repository
        self.scheduler = scheduler
    }
    
    func initGetingDataFromRepository() -> Disposable {
        return dataRequestTriger.flatMap({ [unowned self] _ -> Observable<Response> in
            self.viewShowLoader.onNext(true)
            return self.repository.getWeather(endpoint: Endpoint.getWeatherEndpoint(coordinates: Constants.defaultCoordinates, units: Constants.siUnitsApi))
        }).subscribeOn(scheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: {[unowned self] response in
                self.setData(response: response)
                self.updateView()
            })
    }
    
    func setData(response: Response){
        let currently = response.currently
        let gradient = WeatherConditionsHelper.returnConditionThatStringContains(for: currently.icon)
        if let daily = response.daily.data.last(where: { dailyData -> Bool in
            DateUtils.isTimeDiferenceInADay(fromSeconds: currently.time, toSeconds: dailyData.time)
        }){
            self.data = MainDataModel(currently: currently, daily: daily, conditions: gradient)
        }else{
            print("Error setting data, response doesnt contain daily")
        }
    }
    
    func updateView(){
        self.viewSetBackgroundImages.onNext((icon: data.currently.icon,gradientInfo: data.conditions))
        self.viewShowLoader.onNext(false)
        //osviježiti view
    }
    
    func initialDataRequest(){
        dataRequestTrigered()
    }
    
    private func dataRequestTrigered(){
        dataRequestTriger.onNext(true)
    }
    
}
