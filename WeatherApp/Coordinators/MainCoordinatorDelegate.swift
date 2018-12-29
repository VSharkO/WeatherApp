//
//  MainCoordinatorDelegate.swift
//  AvazBa
//
//  Created by Valentin Šarić on 05/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation

protocol MainCoordinatorDelegate: CoordinatorDelegate,ParentCoordinatorDelegate {
    func openSearchScreenModally()
    func getDataFromChildScreen(weather: Response,city: Geoname)
}
