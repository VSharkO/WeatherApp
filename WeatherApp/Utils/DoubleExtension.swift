//
//  StringExtension.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

extension Double {
    func formatToStringWith(numOfDecimals: Int) -> String {
        return String(format: "%.\(numOfDecimals)f", self)
    }
}
