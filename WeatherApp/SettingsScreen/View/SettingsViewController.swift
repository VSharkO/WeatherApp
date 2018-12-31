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
    weak var coordinatorDelegate: CoordinatorDelegate!
    
    init(viewModel: SettingsViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        initSubscripts()
        }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getCities().disposed(by: disposeBag)
        print(String(viewModel.data.units.rawValue))
        print(viewModel.data.cities[0].name)
        print(viewModel.data.weatherParameters)
    }
    
    private func initSubscripts(){
        //TODO: testno
        viewModel.closeScreen.subscribe(onNext: { _ in
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }

}
