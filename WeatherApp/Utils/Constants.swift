//
//  Constants.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 18/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

struct Constants {
    public static let urlScheme = "https"
    public static let urlHost = "api.darksky.net"
    public static let forecast = "forecast"
    public static let keyForApi = "e905d6142a614454422921875a13e520"
    public static let excludeFromApi = "exclude"
    public static let defaultCityLng = "45.28596"
    public static let defaultCityLat = "17.80639"
    public static let siUnitsApi = "si"
    public static let usUnitsApi = "us"
    public static let headerImage = "header_image-"
    public static let bodyImage = "body_image-"
    public static let highTemperatureText = "High"
    public static let lowTemperatureText = "Low"
    public static let defaultCountryCode = "HR"
    public static let defaultCityName = "Pleternica"
    public static let tempUnitSi = "C"
    public static let windSpeedUnitSi = " mph"
    public static let tempUnitUs = "F"
    public static let windSpeedUnitUs = " mps"
    public static let pressureUnit = " hpa"
    public static let humidityUnit = "%"
}
