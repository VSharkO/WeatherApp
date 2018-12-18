//
//  MainViewController.swift
//  AvazBa
//
//  Created by Valentin Šarić on 16/11/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher
import MaterialComponents.MaterialTabs

class MainViewController: UIViewController{
    
    private var viewModel: MainViewModelProtocol!
    private let disposeBag = DisposeBag()
    var mainCoordinatorDelegate: MainCoordinatorDelegate?
    
    init(viewModel: MainViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        viewModel.initGetingDataFromRepository().disposed(by: self.disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        initSubscripts()
        viewModel.initialDataRequest()
    }
    
    private func initSubscripts(){
//        viewModel.viewReloadData.observeOn(MainScheduler.instance).subscribe(onNext:{ _ in
//            self.tableView.reloadData()
//        }).disposed(by: disposeBag)
//
//        viewModel.viewShowLoader.observeOn(MainScheduler.instance).subscribe(onNext:{ isActive in
//            if isActive{
//                self.displayLoader()
//            }else{
//                self.hideLoader()
//            }
//        }).disposed(by: disposeBag)
        
    }
    
    private func setupViews(){
        self.view.backgroundColor = .white
    }
    
    private func setupConstraints(){
        
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: tabBar.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ])
    }
 
}
