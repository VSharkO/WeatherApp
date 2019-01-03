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
    var transitionDelegate: UIViewControllerTransitioningDelegate
    let viewModel: SettingsViewModel!
    
    init(presenter: UINavigationController,transitionDelegate: UIViewControllerTransitioningDelegate, settingsDataDelegate: SettingsDataDelegate) {
        self.presenter = presenter
        childCoordinators = []
        self.transitionDelegate = transitionDelegate
        self.viewModel = SettingsViewModel(dbHelper: DbHelper(db: try! Realm()), settingsDataDelegate: settingsDataDelegate)
        self.controller = SettingsViewController(viewModel: viewModel)
    }
    
    func start() {
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .overCurrentContext
        viewModel.coordinatorDelegate = self
        presenter.present(controller, animated: true, completion: nil)
    }
    
    func viewHasFinished() {
        controller.dismiss(animated: true, completion: nil)
        mainCoordinatorDelegate?.childHasFinished(coordinator: self)
    }
    
}
