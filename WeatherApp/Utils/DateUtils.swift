//
//  isTimeDiferenceInADay.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 19/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

class DateUtils {
    
    public static func isTimeDiferenceInADay(fromSeconds: Int, toSeconds: Int) -> Bool{
    let currentCalendar = Calendar.current
    return currentCalendar.dateComponents([.day], from: Date.init(timeIntervalSince1970: TimeInterval(fromSeconds)), to: Date.init(timeIntervalSince1970: TimeInterval(toSeconds))).day ?? 2 < 2
    }
}
