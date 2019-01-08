//
//  SettingsCoordinator.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 30/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RealmSwift

class SettingsCoordinator: Coordinator,CoordinatorDelegate{
    var childCoordinators: [Coordinator]
    var controller: SettingsViewController
    weak var mainCoordinatorDelegate: MainCoordinatorDelegate?
    var presenter: UINavigationController
    let viewModel: SettingsViewModel!
    
    init(presenter: UINavigationController, settingsDataDelegate: SettingsDataDelegate) {
        self.presenter = presenter
        childCoordinators = []
        self.viewModel = SettingsViewModel(settingsDataDelegate: settingsDataDelegate, weatherRepository: WeatherRepository(), citiesRepository: CitiesRepository())
        self.controller = SettingsViewController(viewModel: viewModel)
    }
    
    func start() {
        controller.modalPresentationStyle = .overCurrentContext
        controller.coordinatorDelegate = self
        presenter.present(controller, animated: true, completion: nil)
    }
    
    func viewHasFinished() {
        controller.dismiss(animated: true, completion: nil)
        mainCoordinatorDelegate?.childHasFinished(coordinator: self)
    }
    
}
