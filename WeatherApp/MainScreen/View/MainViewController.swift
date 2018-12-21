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
        layer.lineWidth = 1.2
        layer.strokeColor = UIColor.white.cgColor
        dot.layer.addSublayer(layer)
        return dot
    }()
    
    let temperatureTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 72)
        textView.textColor = .white
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let summaryTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 24)
        textView.textColor = .white
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let cityTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Book", size: 36)
        textView.textColor = .white
        textView.text = "Osijek"
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
        textView.font = UIFont(name:"GothamRounded-Light", size: 24)
        textView.textColor = .white
        textView.text = "95.4"
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let minTempPrecentage:UIView = {
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
        textView.font = UIFont(name:"GothamRounded-Light", size: 20)
        textView.text = "Low"
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
        textView.text = "95.4"
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let maxTempPrecentage:UIView = {
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
        textView.text = "High"
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
        textView.text = "C"
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let maxTemperatureUnit : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name:"GothamRounded-Light", size: 24)
        textView.textColor = .white
        textView.text = "C"
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
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
            self.temperatureTextView.text = String(Int(data.temperature))
            self.summaryTextView.text = data.summary
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
        self.view.addSubview(maxContainer)
        self.view.addSubview(minContainer)
        self.view.addSubview(maxDescriptionTextView)
        self.view.addSubview(minDescriptionTextView)
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: self.view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: self.bodyImageView.topAnchor, constant: 140)
            ])
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: gradientView.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor),
            headerImageView.bottomAnchor.constraint(equalTo: gradientView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            bodyImageView.heightAnchor.constraint(equalToConstant: 570),
            bodyImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bodyImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bodyImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            temperatureTextView.topAnchor.constraint(equalTo: gradientView.topAnchor, constant: 90),
            temperatureTextView.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            temperatureTextView.heightAnchor.constraint(equalToConstant: 70),
            temperatureTextView.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            parcentageCircle.topAnchor.constraint(equalTo: headerImageView.topAnchor, constant: 90),
            parcentageCircle.leadingAnchor.constraint(equalTo: temperatureTextView.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            summaryTextView.topAnchor.constraint(equalTo: temperatureTextView.bottomAnchor),
            summaryTextView.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            summaryTextView.heightAnchor.constraint(equalToConstant: 50),
            summaryTextView.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            cityTextView.topAnchor.constraint(equalTo: summaryTextView.bottomAnchor, constant: 50),
            cityTextView.centerXAnchor.constraint(equalTo: bodyImageView.centerXAnchor),
            cityTextView.heightAnchor.constraint(equalToConstant: 70),
            cityTextView.widthAnchor.constraint(equalToConstant: 500 )
            ])
        
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: cityTextView.bottomAnchor, constant: 10),
            separator.centerXAnchor.constraint(equalTo: bodyImageView.centerXAnchor),
            separator.heightAnchor.constraint(equalToConstant: 60),
            separator.widthAnchor.constraint(equalToConstant: 2)
            ])
        
        NSLayoutConstraint.activate([
            minTemperatureUnit.topAnchor.constraint(equalTo: minContainer.topAnchor),
            minTemperatureUnit.trailingAnchor.constraint(equalTo: minContainer.trailingAnchor),
            minTemperatureUnit.bottomAnchor.constraint(equalTo: minContainer.bottomAnchor),
            minTemperatureUnit.widthAnchor.constraint(equalToConstant: 20),
            ])

        NSLayoutConstraint.activate([
            minTempPrecentage.topAnchor.constraint(equalTo: minContainer.topAnchor, constant: 5),
            minTempPrecentage.trailingAnchor.constraint(equalTo: minTemperatureUnit.leadingAnchor),
            minTempPrecentage.heightAnchor.constraint(equalTo: minContainer.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            minTemperature.topAnchor.constraint(equalTo: minContainer.topAnchor),
            minTemperature.trailingAnchor.constraint(equalTo: minTempPrecentage.leadingAnchor, constant: 8),
            minTemperature.bottomAnchor.constraint(equalTo: minContainer.bottomAnchor),
            minTemperature.widthAnchor.constraint(equalToConstant: 85)
            ])
        
        NSLayoutConstraint.activate([
            minContainer.topAnchor.constraint(equalTo: separator.topAnchor),
            minContainer.trailingAnchor.constraint(equalTo: separator.leadingAnchor, constant: -20),
            minContainer.widthAnchor.constraint(equalToConstant: 100),
            minContainer.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            maxTemperature.topAnchor.constraint(equalTo: maxContainer.topAnchor),
            maxTemperature.leadingAnchor.constraint(equalTo: maxContainer.leadingAnchor),
            maxTemperature.bottomAnchor.constraint(equalTo: maxContainer.bottomAnchor),
            maxTemperature.widthAnchor.constraint(equalToConstant: 85)
            ])
        
        NSLayoutConstraint.activate([
            maxTempPrecentage.topAnchor.constraint(equalTo: maxContainer.topAnchor, constant: 5),
            maxTempPrecentage.leadingAnchor.constraint(equalTo: maxTemperature.trailingAnchor, constant: -8),
            maxTempPrecentage.bottomAnchor.constraint(equalTo: maxContainer.bottomAnchor),
            ])
        
        NSLayoutConstraint.activate([
            maxTemperatureUnit.topAnchor.constraint(equalTo: maxContainer.topAnchor),
            maxTemperatureUnit.leadingAnchor.constraint(equalTo: maxTempPrecentage.trailingAnchor),
            maxTemperatureUnit.bottomAnchor.constraint(equalTo: maxContainer.bottomAnchor),
            maxTemperatureUnit.widthAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            maxContainer.topAnchor.constraint(equalTo: separator.topAnchor),
            maxContainer.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 20),
            maxContainer.heightAnchor.constraint(equalToConstant: 30),
            maxContainer.widthAnchor.constraint(equalToConstant: 100)
            ])

        
        NSLayoutConstraint.activate([
            maxDescriptionTextView.bottomAnchor.constraint(equalTo: separator.bottomAnchor),
            maxDescriptionTextView.leadingAnchor.constraint(equalTo: maxContainer.leadingAnchor, constant: 10),
            maxDescriptionTextView.trailingAnchor.constraint(equalTo: maxContainer.trailingAnchor),
            maxDescriptionTextView.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            minDescriptionTextView.bottomAnchor.constraint(equalTo: separator.bottomAnchor),
            minDescriptionTextView.leadingAnchor.constraint(equalTo: minContainer.leadingAnchor, constant: 10),
            minDescriptionTextView.trailingAnchor.constraint(equalTo: minContainer.trailingAnchor),
            minDescriptionTextView.heightAnchor.constraint(equalToConstant: 30)
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
