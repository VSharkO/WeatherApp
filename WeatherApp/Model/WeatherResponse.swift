//
//  Article.swift
//  AvazBa
//
//  Created by Valentin Šarić on 16/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

struct Response: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: Currently
    let daily: Daily
    let offset: Int
}

struct Currently: Codable {
    let time: Int
    let summary, icon: String
    let temperature, humidity: Double
    let pressure, windSpeed: Double
}

struct Daily: Codable {
    let summary, icon: String
    let data: [DailyData]
}

struct DailyData: Codable {
    let time: Int
    let temperatureMin: Double
    let temperatureMax: Double
}
