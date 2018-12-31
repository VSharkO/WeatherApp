//
//  StringExtension.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 31/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

extension Double {
    func formatToStringWithOneDecimal() -> String {
        return String(format: "%.1f", self)
    }
}
