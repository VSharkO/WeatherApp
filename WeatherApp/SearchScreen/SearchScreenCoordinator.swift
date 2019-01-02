//
//  SearchScreenCoordinator.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RealmSwift

class SearchScreenCoordinator: Coordinator, CoordinatorDelegate{

    var childCoordinators: [Coordinator] = []
    weak var mainCoordinatorDelegate: MainCoordinatorDelegate!
    var mainViewModelDelegate: MainViewModelDelegate!
    var controller: SearchViewController
    var presenter: UINavigationController
    var viewModel: SearchViewModel!
    var transitionDelegate: UIViewControllerTransitioningDelegate
    
    
    init(presenter: UINavigationController, transitionDelegate: UIViewControllerTransitioningDelegate, mainViewModelDelegate: MainViewModelDelegate) {
        self.presenter = presenter
        childCoordinators = []
        self.mainViewModelDelegate = mainViewModelDelegate
        viewModel = SearchViewModel(repository: Repository(), dbHelper: DbHelper(db: try! Realm()), mainViewModelDelegate: mainViewModelDelegate)
        controller = SearchViewController(viewModel: viewModel)
        self.transitionDelegate = transitionDelegate
    }
    
    func start() {
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .overCurrentContext
        controller.coordinatorDelegate = self
        viewModel.coordinatorDelegate = self
        presenter.present(controller, animated: true, completion: nil)
    }
    
    func viewHasFinished() {
        controller.dismiss(animated: true, completion: nil)
        mainCoordinatorDelegate?.childHasFinished(coordinator: self)
    }
}
