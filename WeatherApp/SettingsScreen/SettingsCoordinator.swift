//
//  SettingsCoordinator.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 30/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator,CoordinatorDelegate{
    
    var childCoordinators: [Coordinator]
    var controller: SettingsViewController
    var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        childCoordinators = []
        let viewModel = SettingsViewModel()
        self.controller = SettingsViewController(viewModel: viewModel)
    }
    
    func start() {
        
    }
    
    func viewHasFinished() {
        
    }
    
    
}
