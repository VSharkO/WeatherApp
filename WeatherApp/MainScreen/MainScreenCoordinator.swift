//
//  MainScreenCoordinator.swift
//  AvazBa
//
//  Created by Valentin Šarić on 16/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import Foundation
import UIKit

class MainScreenCoordinator : Coordinator, ParentCoordinatorDelegate, MainCoordinatorDelegate{

    var childCoordinators: [Coordinator] = []
    var presenter: UINavigationController
    var viewModel: MainViewModel
    private var controller: MainViewController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.presenter.navigationBar.isTranslucent = false
        viewModel = MainViewModel(repository: Repository())
        controller = MainViewController(viewModel: viewModel)
    }
    
    func start() {
        presenter.pushViewController(controller, animated: true)
        controller.mainCoordinatorDelegate = self
    }
    
    func viewHasFinished() {
        childCoordinators.removeAll()
    }
    
    func childHasFinished(coordinator: Coordinator) {
        removeChildCoordinator(childCoordinator: coordinator)
    }
    
    func openSearchScreenModally() {
        let searchCoordinator = SearchScreenCoordinator(presenter: self.presenter, transitionDelegate: controller)
        self.childCoordinators.append(searchCoordinator)
        searchCoordinator.mainCoordinatorDelegate = self
        searchCoordinator.start()
    }
    
    func getDataFromChildScreen(weather: Response, city: Geoname) {
        viewModel.setData(response: weather)
        viewModel.city = city
        viewModel.updateView()
    }
}
