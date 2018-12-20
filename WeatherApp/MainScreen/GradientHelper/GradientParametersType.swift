//
//  GradientParametersType.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 20/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

struct GradientParameters{
    let colors: [UIColor]
    let points: GradientPoints
}

struct GradientPoints{
    let startPoint: CGPoint
    let endPoint: CGPoint
}
