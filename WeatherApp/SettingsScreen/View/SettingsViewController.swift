//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 30/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift

class SettingsViewController: UIViewController {
    
    var viewModel: SettingsViewModelProtocol!
    var disposeBag: DisposeBag!
    
    init(viewModel: SettingsViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupViews()
        initSubscripts()
        viewModel.initGetCities().disposed(by: disposeBag)
        }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getCitiesFromDb()
    }
    
    private func setupViews(){
        view.backgroundColor = .blue
    }
    
    private func initSubscripts(){
        
    }

}
