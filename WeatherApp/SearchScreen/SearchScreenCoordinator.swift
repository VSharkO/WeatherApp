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
        self.transitionDelegate = transitionDelegate
        childCoordinators = []
        let viewModel = SearchViewModel(repository: Repository())
        controller = SearchViewController(viewModel: viewModel)
    }
    
    func start() {
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .overCurrentContext
        presenter.present(controller, animated: true, completion: nil)
    }
    
    func viewHasFinished() {
        parentCoordinatorDelegate?.childHasFinished(coordinator: self)
    }
    
}
