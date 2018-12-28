//
//  SearchScreenCoordinator.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class SearchScreenCoordinator: Coordinator, CoordinatorDelegate{
    
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinatorDelegate: ParentCoordinatorDelegate?
    var controller: SearchViewController
    var presenter: UINavigationController
    var transitionDelegate: UIViewControllerTransitioningDelegate
    
    
    init(presenter: UINavigationController, transitionDelegate: UIViewControllerTransitioningDelegate) {
        self.presenter = presenter
        childCoordinators = []
        let viewModel = SearchViewModel(repository: Repository())
        controller = SearchViewController(viewModel: viewModel)
        self.transitionDelegate = transitionDelegate
    }
    
    func start() {
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .overCurrentContext
        controller.coordinatorDelegate = self
        presenter.present(controller, animated: true, completion: nil)
    }
    
    func viewHasFinished() {
        controller.dismiss(animated: true, completion: nil)
        parentCoordinatorDelegate?.childHasFinished(coordinator: self)
    }
    
}
