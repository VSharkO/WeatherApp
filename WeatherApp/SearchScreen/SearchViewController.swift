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
        view.layer.cornerRadius = 15
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let searchBarText: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Search"
        label.layer.cornerRadius = 15
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "search_icon")
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setupNotificationObserver()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchBarText.becomeFirstResponder()
    }
    
    private func setupViews(){
//        self.addBlureBackground()
        self.view.addSubview(searchConteiner)
        self.searchConteiner.addSubview(searchBarText)
        self.searchConteiner.addSubview(searchIcon)
        
        setupConstraints()
    }
    
//    private func addBlureBackground(){
//        let blurEffect = UIBlurEffect(style: .dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(blurEffectView)
//    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            searchConteiner.leadingAnchor.constraint(lessThanOrEqualTo: self.view.leadingAnchor, constant: 30),
            searchConteiner.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -30),
            searchConteiner.heightAnchor.constraint(equalToConstant: 30),
            searchConteiner.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
            ])
        
        NSLayoutConstraint.activate([
            searchBarText.leadingAnchor.constraint(equalTo: searchConteiner.leadingAnchor, constant: 10),
            searchBarText.trailingAnchor.constraint(equalTo: searchIcon.leadingAnchor, constant: -5),
            searchBarText.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor),
            searchBarText.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            searchIcon.leadingAnchor.constraint(equalTo: searchBarText.trailingAnchor, constant: 5),
            searchIcon.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor),
            searchIcon.trailingAnchor.constraint(equalTo: searchConteiner.trailingAnchor, constant: -10)
            ])
    }
    
    private func setupNotificationObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
 
    @objc func keyboardWillChange(notification: Notification){
        view.frame.origin.y = -300
        // po veličini tipkovnice napraviti ovo.
    }

}
