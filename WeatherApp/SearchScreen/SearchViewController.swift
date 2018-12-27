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
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let searchBarText: UITextField = {
        let label = UITextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.placeholder = "Search"
        label.layer.cornerRadius = 15
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "search_icon")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let doneIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "square_checkmark_check")
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    let settingsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "settings_icon")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private var viewModel: SearchViewModelProtocol!
    
    init(viewModel: SearchViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setupNotificationObserver()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        searchBarText.becomeFirstResponder()
    }
    
    private func setupViews(){
        self.searchConteiner.addSubview(searchBarText)
        self.searchConteiner.addSubview(searchIcon)
        self.view.addSubview(settingsImage)
        self.view.addSubview(searchConteiner)
        self.view.addSubview(doneIcon)
        setupConstraints()
    }
    
    var bottomConstraint: NSLayoutConstraint!
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    var trailingAnchorSettings: NSLayoutConstraint!
    var leadingAnchorSettings: NSLayoutConstraint!
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            searchConteiner.heightAnchor.constraint(equalToConstant: 30)
            ])
        leadingConstraint = searchConteiner.leadingAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        leadingConstraint.isActive = true
        bottomConstraint = searchConteiner.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        bottomConstraint.isActive = true
        trailingConstraint = searchConteiner.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -10)
        trailingConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            searchBarText.leadingAnchor.constraint(equalTo: searchConteiner.leadingAnchor, constant: 20),
            searchBarText.trailingAnchor.constraint(equalTo: searchIcon.leadingAnchor, constant: -5),
            searchBarText.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor),
            searchBarText.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            searchIcon.leadingAnchor.constraint(equalTo: searchBarText.trailingAnchor, constant: 5),
            searchIcon.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor),
            searchIcon.trailingAnchor.constraint(equalTo: searchConteiner.trailingAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            settingsImage.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor)
            ])
        leadingAnchorSettings = settingsImage.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        leadingAnchorSettings.isActive = true
        trailingAnchorSettings = settingsImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        trailingAnchorSettings.isActive = true
        settingsImage.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            doneIcon.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            doneIcon.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
            ])
    }
    
    private func setupNotificationObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
 
    @objc func keyboardWillChange(notification: Notification){
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
        UIView.animate(withDuration: 0, animations: {
            self.bottomConstraint.constant = isKeyboardShowing ? -keyboardFrame.height - 10 : -15
            self.leadingConstraint.constant = isKeyboardShowing ? 20 : 40
            self.trailingConstraint.constant = isKeyboardShowing ? -20 : -40
            self.trailingAnchorSettings.constant = isKeyboardShowing ? 0 : 40
            self.leadingAnchorSettings.constant = isKeyboardShowing ? -30 : 30
            self.view.layoutIfNeeded()
        })
        
    }
    
}
