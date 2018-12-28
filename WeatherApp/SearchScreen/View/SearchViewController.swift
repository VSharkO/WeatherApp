//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let searchConteiner: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let blureBackground: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
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
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    let doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "checkmark_check"), for: UIControl.State.normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let settingsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "settings_icon")
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    let tableVeiw: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.alpha = 0
        return tableView
    }()
    
    private var viewModel: SearchViewModelProtocol!
    var coordinatorDelegate: CoordinatorDelegate!
    let disposeBag = DisposeBag()
    
    init(viewModel: SearchViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .clear
        setupViews()
        setupNotificationObserver()
        registerTouchListeners()
        setupObservingSearchText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerTouchListeners()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.initGetingDataFromRepository().disposed(by: disposeBag)
        searchBarText.becomeFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SearchCell()
        cell.backgroundColor = .clear
        return cell
    }
    
    private func setupViews(){
        tableVeiw.delegate = self
        tableVeiw.dataSource = self
        self.view.addSubview(blureBackground)
        self.view.addSubview(tableVeiw)
        self.searchConteiner.addSubview(searchBarText)
        self.searchConteiner.addSubview(searchIcon)
        self.view.addSubview(settingsImage)
        self.view.addSubview(searchConteiner)
        self.view.addSubview(doneButton)
        setupConstraints()
    }
    
    var bottomConstraint: NSLayoutConstraint!
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    var trailingAnchorSettings: NSLayoutConstraint!
    var leadingAnchorSettings: NSLayoutConstraint!
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            blureBackground.topAnchor.constraint(equalTo: self.view.topAnchor),
            blureBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blureBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            blureBackground.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        searchConteiner.heightAnchor.constraint(equalToConstant: 30).isActive = true
        leadingConstraint = searchConteiner.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        leadingConstraint = searchConteiner.leadingAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 60)
        bottomConstraint = searchConteiner.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        trailingConstraint = searchConteiner.trailingAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        bottomConstraint.isActive = true
        leadingConstraint.isActive = true
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
        
        settingsImage.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor).isActive = true
        settingsImage.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        trailingAnchorSettings = settingsImage.trailingAnchor.constraint(equalTo: searchConteiner.leadingAnchor, constant: -10)
        trailingAnchorSettings.isActive = true
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            doneButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            tableVeiw.topAnchor.constraint(equalTo: self.doneButton.centerYAnchor),
            tableVeiw.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableVeiw.trailingAnchor.constraint(equalTo: self.doneButton.leadingAnchor),
            tableVeiw.heightAnchor.constraint(greaterThanOrEqualToConstant: self.view.frame.height * 0.5)
            ])
    }
    private func setupObservingSearchText(){
        searchBarText.rx.text.orEmpty.debounce(0.25, scheduler: MainScheduler.instance).subscribe(onNext: {[unowned self] dynamicString in
            self.viewModel.dynamicSearchString.onNext(dynamicString)
        }).disposed(by: disposeBag)
    }
    
    private func setupNotificationObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func registerTouchListeners(){
        self.doneButton.addTarget(self, action: #selector (self.closeScreen(_:)), for: UIControl.Event.touchUpInside)
    }
 
    @objc func closeScreen(_ sender: UIButton){
        print("closeing SearchScreen")
        searchBarText.resignFirstResponder()
        self.coordinatorDelegate.viewHasFinished()
    }
        
    @objc func keyboardWillChange(notification: Notification){
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
        UIView.animate(withDuration: 0, animations: {
            self.bottomConstraint.constant = isKeyboardShowing ? -keyboardFrame.height - 10 : -15
            self.leadingConstraint.constant = isKeyboardShowing ? 10 : 60
            self.trailingConstraint.constant = isKeyboardShowing ? -10 : -20
            self.trailingAnchorSettings.constant = isKeyboardShowing ? -20 : -10
            self.blureBackground.alpha = isKeyboardShowing ? 0.95 : 0
            self.tableVeiw.alpha = isKeyboardShowing ? 1.0 : 0.0
            self.view.layoutIfNeeded()
        })
    }
}
