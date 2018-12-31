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
    
    let scheduler: SchedulerType!
    
    init(scheduler: SchedulerType = ConcurrentDispatchQueueScheduler(qos: .background)) {
        self.scheduler = scheduler
    }
    
    
}
