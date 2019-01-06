//
//  GradientHelper.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 20/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class GradientHelper{
    
    public static func getGradientParametersForCondition(condition: Condition) -> GradientParameters{
        switch condition {
        case .fog:
            return GradientParameters(colors: [UIColor(hex: "D8D8D8"),UIColor(hex:"ABD6E9")], points: GradientPoints(startPoint: CGPoint(x: 0.5, y: 1.0), endPoint: CGPoint(x: 0.5, y: 0.0)))
        case .rain:
            return GradientParameters(colors: [UIColor(hex:"4A75A2"), UIColor(hex: "15587B")], points: GradientPoints(startPoint: CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint(x: 1.0, y: 0.0)))
        case .snow:
            return GradientParameters(colors: [UIColor(hex:"80D5F3"), UIColor(hex: "0B3A4E")], points: GradientPoints(startPoint: CGPoint(x: 0.5, y: 1.0), endPoint: CGPoint(x: 0.5, y: 0.0)))
        case .night:
            return GradientParameters(colors: [UIColor(hex:"234880"), UIColor(hex: "044663")], points: GradientPoints(startPoint: CGPoint(x: 0.5, y: 1.0), endPoint: CGPoint(x: 0.5, y: 0.0)))
        default:
            //day
            return GradientParameters(colors: [UIColor(hex:"D8D8D8"), UIColor(hex: "59B7E0")], points: GradientPoints(startPoint: CGPoint(x: 0.5, y: 1.0), endPoint: CGPoint(x: 0.5, y: 0.0)))
        }
    }
}

