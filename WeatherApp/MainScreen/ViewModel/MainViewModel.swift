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
                self.setDataWithResponse(response: response)
                
            })
    }
    
    func setDataWithResponse(response: Response){
        let currently = response.currently
        if let daily = response.daily.data.last(where: { dailyData -> Bool in
            DateUtils.isTimeDiferenceInADay(fromSeconds: currently.time, toSeconds: dailyData.time)
        }){
            self.data = MainDataModel(currently: currently, daily: daily)
            self.viewShowLoader.onNext(false)
            //osviježiti view
            print(self.data.currently.time)
            print(self.data.daily.time)
        }
    }
    
    
    
    func initialDataRequest(){
        dataRequestTrigered()
    }
    
    private func dataRequestTrigered(){
        dataRequestTriger.onNext(true)
    }
    
}
