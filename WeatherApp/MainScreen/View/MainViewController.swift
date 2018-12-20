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
    layer.lineWidth = 3
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
            summaryTextView.heightAnchor.constraint(equalToConstant: 80),
            summaryTextView.widthAnchor.constraint(equalToConstant: 250)
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
