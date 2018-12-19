//
//  isTimeDiferenceInADay.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 19/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

class TimeDiferenceHelper{
    public static func isTimeDiferenceInADay(fromSeconds: Int, toSeconds: Int) -> Bool{
    let currentCalendar = Calendar.current
        if let diference = currentCalendar.dateComponents([.hour], from: Date(timeIntervalSince1970: TimeInterval(fromSeconds)), to: Date(timeIntervalSince1970: TimeInterval(toSeconds))).hour{
            return abs(diference) < 24
        }else{
            return false
        }
    }
}
