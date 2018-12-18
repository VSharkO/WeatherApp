//
//  Endpoint.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 18/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

struct Endpoint {
    let host: String
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}

extension Endpoint {
    
    static func getWeatherEndpoint(coordinates: String ,units: String) -> Endpoint {
        return Endpoint(
            host: "api.darksky.net",
            path: "/forecast/e905d6142a614454422921875a13e520/"+coordinates,
            queryItems: [
                URLQueryItem(name: "exclude", value: "[minutely,hourly,alerts,flags]"),
                URLQueryItem(name: "units", value: units)
            ]
        )
    }
}
