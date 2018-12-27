//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchConteiner: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let searchBarText: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Search"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchBarText.becomeFirstResponder()
    }
    
    private func setupViews(){
        self.addBlureBackground()
        self.view.addSubview(searchConteiner)
        self.view.addSubview(searchBarText)
        setupConstraints()
    }
    
    private func addBlureBackground(){
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            searchConteiner.leadingAnchor.constraint(lessThanOrEqualTo: self.view.leadingAnchor, constant: 30),
            searchConteiner.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -30),
            searchConteiner.heightAnchor.constraint(equalToConstant: 40),
            searchConteiner.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
            ])
        
        NSLayoutConstraint.activate([
            searchBarText.leadingAnchor.constraint(equalTo: searchConteiner.leadingAnchor, constant: 15),
            searchBarText.trailingAnchor.constraint(equalTo: searchConteiner.trailingAnchor, constant: -15),
            searchBarText.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor),
            searchBarText.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
 
    

}
