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
    
    let blureBackground: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    let locationsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location"
        label.textColor = .white
        label.font = UIFont(name:"GothamRounded-Book", size: 18)
        return label
    }()
    
    let locationsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
        tableView.separatorColor = .red
        return tableView
    }()
    
    let unitsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Units"
        label.textColor = .white
        label.font = UIFont(name:"GothamRounded-Book", size: 18)
        return label
    }()
    
    let unitsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
        tableView.separatorColor = .red
        return tableView
    }()
    
    let conditionsTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Conditions"
        label.textColor = .white
        label.font = UIFont(name:"GothamRounded-Book", size: 18)
        return label
    }()
    
    let horizontalStackConditions: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        return stackView
    }()
    
    let verticalStackHumidity: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let verticalStackWind: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let verticalStackPressure: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let imageHumidity: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "humidity_icon")
        return image
    }()
    
    let buttonHumidity: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
        return button
    }()
    
    let imageWind: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "wind_icon")
        return image
    }()
    
    let buttonWind: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
        return button
    }()
    
    let imagePressure: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pressure_icon")
        return image
    }()
    
    let buttonPressure: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "checkmark_uncheck"), for: .normal)
        return button
    }()
    
    let buttonDone: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.setImage(TransparentTextHelper.maskedImage(size: CGSize.init(width: 120, height: 50), text: "Done"), for: .normal)
        return button
    }()
    
    
    
    weak var coordinatorDelegate: CoordinatorDelegate?
    var viewModel: SettingsViewModelProtocol!
    var disposeBag: DisposeBag!
    
    init(viewModel: SettingsViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
    }
    
    deinit {
        print("Settings screen deinited")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupViews()
        initSubscripts()
        viewModel.initGetCities().disposed(by: disposeBag)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getCitiesFromDb()
        viewModel.setCityToShowInDataModel()
    }
    
    private func setupViews(){
        self.view.backgroundColor = .clear
        self.view.addSubview(blureBackground)
        self.view.addSubview(locationsTitle)
        self.view.addSubview(locationsTableView)
        self.view.addSubview(unitsTitle)
        self.view.addSubview(unitsTableView)
        self.view.addSubview(conditionsTitle)
        self.view.addSubview(horizontalStackConditions)
        self.view.addSubview(buttonDone)
        self.horizontalStackConditions.addArrangedSubview(verticalStackHumidity)
        self.horizontalStackConditions.addArrangedSubview(verticalStackWind)
        self.horizontalStackConditions.addArrangedSubview(verticalStackPressure)
        self.verticalStackHumidity.addArrangedSubview(imageHumidity)
        self.verticalStackHumidity.addArrangedSubview(buttonHumidity)
        self.verticalStackWind.addArrangedSubview(imageWind)
        self.verticalStackWind.addArrangedSubview(buttonWind)
        self.verticalStackPressure.addArrangedSubview(imagePressure)
        self.verticalStackPressure.addArrangedSubview(buttonPressure)
        
        self.setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            blureBackground.topAnchor.constraint(equalTo: self.view.topAnchor),
            blureBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blureBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blureBackground.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            locationsTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 22),
            locationsTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            locationsTableView.topAnchor.constraint(equalTo: self.locationsTitle.bottomAnchor, constant: 22),
            locationsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            locationsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            locationsTableView.bottomAnchor.constraint(lessThanOrEqualTo: self.locationsTitle.bottomAnchor, constant: 160)
            ])
        
        NSLayoutConstraint.activate([
            unitsTitle.topAnchor.constraint(equalTo: self.locationsTableView.bottomAnchor, constant: 22),
            unitsTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            unitsTableView.topAnchor.constraint(equalTo: self.unitsTitle.bottomAnchor, constant: 20),
            unitsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            unitsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            unitsTableView.bottomAnchor.constraint(lessThanOrEqualTo: self.unitsTitle.bottomAnchor, constant: 120)
            ])
        
        NSLayoutConstraint.activate([
            conditionsTitle.topAnchor.constraint(equalTo: self.unitsTableView.bottomAnchor, constant: 22),
            conditionsTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            horizontalStackConditions.topAnchor.constraint(equalTo: self.conditionsTitle.bottomAnchor, constant: 20),
            horizontalStackConditions.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 20),
            horizontalStackConditions.leadingAnchor.constraint(lessThanOrEqualTo: self.view.leadingAnchor, constant: 40),
            horizontalStackConditions.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor, constant: -20),
            horizontalStackConditions.trailingAnchor.constraint(greaterThanOrEqualTo: self.view.trailingAnchor, constant: -40),
            horizontalStackConditions.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            buttonDone.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            buttonDone.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -15),
            buttonDone.widthAnchor.constraint(equalToConstant: 120),
            buttonDone.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
    }
    
    private func initSubscripts(){
        viewModel.viewCloseScreen.subscribe(onNext: { [unowned self] _ in
            self.coordinatorDelegate?.viewHasFinished()
        }).disposed(by: disposeBag)
    }

}
