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
import Hue

class MainViewController: UIViewController, LoaderManager{
    
    var gradient: CAGradientLayer!
    
    let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let bodyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let gradientView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let parcentageCircle:UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.backgroundColor = .white
        let dotPath = UIBezierPath(roundedRect: CGRect(x: -10, y: 0, width: 10, height: 10), cornerRadius: 10)
        let layer = CAShapeLayer()
        layer.path = dotPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 3
        layer.strokeColor = UIColor.white.cgColor
        dot.layer.addSublayer(layer)
        return dot
    }()
    
    let temperatureTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "GothamRounded-Light", size: 72)
        textView.textColor = .white
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let summaryTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 24)
        textView.textColor = .white
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let cityTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Book", size: 36)
        textView.textColor = .white
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let separator : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let minTemperature : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 24)
        textView.textColor = .white
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let minTempPrecentage: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.backgroundColor = .white
        let dotPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 5, height: 5), cornerRadius: 5)
        let layer = CAShapeLayer()
        layer.path = dotPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 1
        layer.strokeColor = UIColor.white.cgColor
        dot.layer.addSublayer(layer)
        return dot
    }()
    
    let minDescriptionTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 20)
        textView.text = Constants.lowTemperatureText
        textView.isScrollEnabled = false
        textView.textColor = .white
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let maxTemperature : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 24)
        textView.textColor = .white
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let maxTempPrecentage: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.backgroundColor = .white
        let dotPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 5, height: 5), cornerRadius: 5)
        let layer = CAShapeLayer()
        layer.path = dotPath.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 1
        layer.strokeColor = UIColor.white.cgColor
        dot.layer.addSublayer(layer)
        return dot
    }()
    
    let maxDescriptionTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 20)
        textView.textColor = .white
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.text = Constants.highTemperatureText
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let maxContainer: UIView = {
        let conteiner = UIView()
        conteiner.translatesAutoresizingMaskIntoConstraints = false
        return conteiner
    }()
    
    let minContainer: UIView = {
        let conteiner = UIView()
        conteiner.translatesAutoresizingMaskIntoConstraints = false
        return conteiner
    }()
    
    let minTemperatureUnit : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 24)
        textView.textColor = .white
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let maxTemperatureUnit : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 24)
        textView.textColor = .white
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let minVerticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    let maxVerticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    let humidityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "humidity_icon")
        return imageView
    }()
    
    let windIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "wind_icon")
        return imageView
    }()
    
    let pressureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pressure_icon")
        return imageView
    }()
    
    let humidityText : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 20)
        textView.textColor = .white
        textView.textContainer.maximumNumberOfLines = 1
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let windSpeedText : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 20)
        textView.textColor = .white
        textView.textContainer.maximumNumberOfLines = 1
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let pressureText : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 20)
        textView.textColor = .white
        textView.textContainer.maximumNumberOfLines = 1
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let verticalHumidityStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    let verticalPressureStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    let verticalWindStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    let horizontalStackConditions: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.alignment = .center
        return stackView
    }()
    
    let searchConteiner: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    let settingsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "settings_icon")
        return imageView
    }()
    
    var loader : UIView?
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
        initSubscripts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.initialDataRequest()
    }
    
    private func initSubscripts(){
        viewModel.viewShowLoader.observeOn(MainScheduler.instance).subscribe(onNext:{ isActive in
            if isActive{
                self.displayLoader()
            }else{
                self.hideLoader()
            }
        }).disposed(by: disposeBag)
        
        viewModel.viewSetBackgroundImages.observeOn(MainScheduler.instance).subscribe(onNext:{[unowned self] (icon, gradientInfo) in
            self.headerImageView.image = UIImage(named: Constants.headerImage+icon)
            self.bodyImageView.image = UIImage(named: Constants.bodyImage+icon)
            if let gradient = gradientInfo{
                self.setupGradient(parameters: GradientHelper.getGradientParametersForCondition(condition: gradient))
            }
        }).disposed(by: disposeBag)
        
        viewModel.viewLoadWithData.observeOn(MainScheduler.instance).subscribe(onNext: {[unowned self] data in
            self.temperatureTextView.text = String(Int(data.currently.temperature))
            self.summaryTextView.text = data.currently.summary
            self.maxTemperatureUnit.text = self.viewModel.tempUnit
            self.minTemperatureUnit.text = self.viewModel.tempUnit
            self.cityTextView.text = self.viewModel.cityName
            self.maxTemperature.text = String(format: "%.1f",data.daily.temperatureMax)
            self.minTemperature.text = String(format: "%.1f",data.daily.temperatureMin)
            self.humidityText.text = String(format: "%.1f",data.currently.humidity) + Constants.humidityUnit
            self.pressureText.text = String(Int(data.currently.pressure)) + Constants.pressureUnit
            self.windSpeedText.text = String(format: "%.1f",data.currently.windSpeed) + self.viewModel.windSpeedUnit
        }).disposed(by: disposeBag)
        
    }
    
    private func setupViews(){
        self.view.addSubview(gradientView)
        self.view.addSubview(bodyImageView)
        self.view.addSubview(headerImageView)
        self.view.addSubview(temperatureTextView)
        self.view.addSubview(parcentageCircle)
        self.view.addSubview(summaryTextView)
        self.view.addSubview(cityTextView)
        self.view.addSubview(separator)
        self.minContainer.addSubview(minTemperature)
        self.minContainer.addSubview(minTempPrecentage)
        self.minContainer.addSubview(minTemperatureUnit)
        self.maxContainer.addSubview(maxTemperatureUnit)
        self.maxContainer.addSubview(maxTempPrecentage)
        self.maxContainer.addSubview(maxTemperature)
        self.view.addSubview(minVerticalStack)
        self.view.addSubview(maxVerticalStack)
        self.minVerticalStack.addArrangedSubview(minContainer)
        self.minVerticalStack.addArrangedSubview(minDescriptionTextView)
        self.maxVerticalStack.addArrangedSubview(maxContainer)
        self.maxVerticalStack.addArrangedSubview(maxDescriptionTextView)
        self.verticalWindStack.addArrangedSubview(windIcon)
        self.verticalWindStack.addArrangedSubview(windSpeedText)
        self.verticalPressureStack.addArrangedSubview(pressureIcon)
        self.verticalPressureStack.addArrangedSubview(pressureText)
        self.verticalHumidityStack.addArrangedSubview(humidityIcon)
        self.verticalHumidityStack.addArrangedSubview(humidityText)
        self.horizontalStackConditions.addArrangedSubview(verticalHumidityStack)
        self.horizontalStackConditions.addArrangedSubview(verticalWindStack)
        self.horizontalStackConditions.addArrangedSubview(verticalPressureStack)
        self.view.addSubview(horizontalStackConditions)
        self.view.addSubview(searchConteiner)
        self.view.addSubview(settingsImage)
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: self.view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            gradientView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1/2.8)
            ])
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            bodyImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height*0.2),
            bodyImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bodyImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bodyImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            temperatureTextView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            temperatureTextView.centerYAnchor.constraint(equalTo: gradientView.centerYAnchor),
            temperatureTextView.heightAnchor.constraint(equalToConstant: 70),
            temperatureTextView.bottomAnchor.constraint(lessThanOrEqualTo: summaryTextView.topAnchor)
            ])
        
        NSLayoutConstraint.activate([
            parcentageCircle.topAnchor.constraint(equalTo: temperatureTextView.topAnchor),
            parcentageCircle.leadingAnchor.constraint(equalTo: temperatureTextView.trailingAnchor, constant: 5)
            ])
        
        NSLayoutConstraint.activate([
            summaryTextView.topAnchor.constraint(equalTo: temperatureTextView.bottomAnchor),
            summaryTextView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            summaryTextView.heightAnchor.constraint(equalToConstant: 30),
            summaryTextView.bottomAnchor.constraint(lessThanOrEqualTo: cityTextView.topAnchor)
            ])
        
        NSLayoutConstraint.activate([
            cityTextView.topAnchor.constraint(lessThanOrEqualTo: gradientView.bottomAnchor, constant: 20),
            cityTextView.topAnchor.constraint(greaterThanOrEqualTo: gradientView.bottomAnchor, constant: 10),
            cityTextView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            cityTextView.heightAnchor.constraint(equalToConstant: 50),
            cityTextView.bottomAnchor.constraint(lessThanOrEqualTo: separator.topAnchor)
            ])
        
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(greaterThanOrEqualTo: cityTextView.bottomAnchor, constant: 10),
            separator.topAnchor.constraint(lessThanOrEqualTo: cityTextView.bottomAnchor, constant: 30),
            separator.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            separator.heightAnchor.constraint(equalTo: maxVerticalStack.heightAnchor),
            separator.widthAnchor.constraint(equalToConstant: 2),
            separator.bottomAnchor.constraint(lessThanOrEqualTo: horizontalStackConditions.topAnchor)
            ])
        
        NSLayoutConstraint.activate([
            minTemperatureUnit.topAnchor.constraint(equalTo: minContainer.topAnchor),
            minTemperatureUnit.trailingAnchor.constraint(equalTo: minContainer.trailingAnchor),
            minTemperatureUnit.bottomAnchor.constraint(equalTo: minContainer.bottomAnchor)
            ])

        NSLayoutConstraint.activate([
            minTempPrecentage.topAnchor.constraint(equalTo: minContainer.topAnchor, constant: 5),
            minTempPrecentage.trailingAnchor.constraint(equalTo: minTemperatureUnit.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            minTemperature.topAnchor.constraint(equalTo: minContainer.topAnchor),
            minTemperature.leadingAnchor.constraint(equalTo: minContainer.leadingAnchor),
            minTemperature.trailingAnchor.constraint(equalTo: minTempPrecentage.leadingAnchor),
            minTemperature.bottomAnchor.constraint(equalTo: minContainer.bottomAnchor),
            ])
        
        NSLayoutConstraint.activate([
            maxTemperature.topAnchor.constraint(equalTo: maxContainer.topAnchor),
            maxTemperature.leadingAnchor.constraint(equalTo: maxContainer.leadingAnchor),
            maxTemperature.bottomAnchor.constraint(equalTo: maxContainer.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            minContainer.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            maxContainer.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            minDescriptionTextView.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            maxDescriptionTextView.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            maxTempPrecentage.topAnchor.constraint(equalTo: maxContainer.topAnchor, constant: 5),
            maxTempPrecentage.leadingAnchor.constraint(equalTo: maxTemperature.trailingAnchor),
            maxTempPrecentage.bottomAnchor.constraint(equalTo: maxContainer.bottomAnchor),
            ])
        
        NSLayoutConstraint.activate([
            maxTemperatureUnit.topAnchor.constraint(equalTo: maxContainer.topAnchor),
            maxTemperatureUnit.leadingAnchor.constraint(equalTo: maxTempPrecentage.trailingAnchor),
            maxTemperatureUnit.bottomAnchor.constraint(equalTo: maxContainer.bottomAnchor),
            maxTemperatureUnit.trailingAnchor.constraint(equalTo: maxContainer.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            minVerticalStack.topAnchor.constraint(greaterThanOrEqualTo: separator.topAnchor),
            minVerticalStack.trailingAnchor.constraint(equalTo: separator.leadingAnchor, constant: -40),
            minVerticalStack.heightAnchor.constraint(equalTo: separator.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            maxVerticalStack.topAnchor.constraint(greaterThanOrEqualTo: separator.topAnchor),
            maxVerticalStack.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 40),
            maxVerticalStack.heightAnchor.constraint(equalTo: separator.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            verticalHumidityStack.widthAnchor.constraint(equalTo: verticalWindStack.widthAnchor),
            verticalWindStack.widthAnchor.constraint(equalTo: verticalPressureStack.widthAnchor)
            ])
        
        NSLayoutConstraint.activate([
            horizontalStackConditions.topAnchor.constraint(lessThanOrEqualTo: separator.bottomAnchor, constant: 60),
            horizontalStackConditions.topAnchor.constraint(greaterThanOrEqualTo: separator.bottomAnchor, constant: 20),
            horizontalStackConditions.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            horizontalStackConditions.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor),
            horizontalStackConditions.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor),
            horizontalStackConditions.bottomAnchor.constraint(lessThanOrEqualTo: searchConteiner.topAnchor)
            ])
        
        NSLayoutConstraint.activate([
            humidityText.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            pressureText.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            windSpeedText.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        
        
        NSLayoutConstraint.activate([
            searchConteiner.topAnchor.constraint(greaterThanOrEqualTo: self.horizontalStackConditions.bottomAnchor, constant: 15),
            searchConteiner.topAnchor.constraint(lessThanOrEqualTo: self.horizontalStackConditions.bottomAnchor, constant: 60),
            searchConteiner.leadingAnchor.constraint(equalTo: settingsImage.trailingAnchor, constant: 5),
            searchConteiner.trailingAnchor.constraint(equalTo: self.pressureText.trailingAnchor),
            searchConteiner.heightAnchor.constraint(equalToConstant: 40),
            searchConteiner.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
            ])
        
        NSLayoutConstraint.activate([
            settingsImage.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor),
            settingsImage.leadingAnchor.constraint(equalTo: humidityText.leadingAnchor),
            settingsImage.trailingAnchor.constraint(equalTo: searchConteiner.leadingAnchor, constant: -10)
            ])
        
    }
    
    private func setupGradient(parameters: GradientParameters){
        gradient = parameters.colors.gradient()
        gradient.startPoint = parameters.points.startPoint
        gradient.endPoint = parameters.points.endPoint
        gradient.frame = gradientView.bounds
        self.gradientView.layer.addSublayer(gradient)
    }
    
    func displayLoader() {
        loader = displayLoader(onView: self.view)
    }
    
    func hideLoader() {
        if let loader = loader{
            removeLoader(loader: loader)
        }
    }
 
}
