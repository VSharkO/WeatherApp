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
        view.alpha = 0
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let blureBackground: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.alpha = 0
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
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "search_icon"), for: UIControl.State.normal)
        button.isUserInteractionEnabled = true
        return button
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
        imageView.alpha = 0
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
        setupNotificationObservers()
        registerButtonTouchListeners()
        setupObservingSearchText()
        initSubscripts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.initGetingDataFromRepository().disposed(by: disposeBag)
        searchBarText.becomeFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SearchCell()
        let cityInfo = viewModel.data[indexPath.row]
        var cityName = cityInfo.name
        if let countryCode = cityInfo.countryCode{
            cityName.append(contentsOf: " " + countryCode)
        }
        cell.cityNameText.text = cityName
        cell.firstLetterTextView.text = String(viewModel.data[indexPath.row].name.prefix(1))
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.citySelected(index: indexPath.row)
    }
    
    private func setupViews(){
        tableVeiw.delegate = self
        tableVeiw.dataSource = self
        self.view.addSubview(blureBackground)
        self.view.addSubview(tableVeiw)
        self.searchConteiner.addSubview(searchBarText)
        self.searchConteiner.addSubview(searchButton)
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
        leadingConstraint = searchConteiner.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        leadingConstraint = searchConteiner.leadingAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 100)
        bottomConstraint = searchConteiner.bottomAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        trailingConstraint = searchConteiner.trailingAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -40)
        bottomConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            searchBarText.leadingAnchor.constraint(equalTo: searchConteiner.leadingAnchor, constant: 20),
            searchBarText.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -5),
            searchBarText.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor),
            searchBarText.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate([
            searchButton.leadingAnchor.constraint(equalTo: searchBarText.trailingAnchor, constant: 5),
            searchButton.centerYAnchor.constraint(equalTo: searchConteiner.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: searchConteiner.trailingAnchor, constant: -10)
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
    
    private func initSubscripts(){
        viewModel.viewRefreshTableViewData.subscribe(onNext: { [unowned self] _ in
            self.tableVeiw.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func setupObservingSearchText(){
        searchBarText.rx.text.orEmpty.debounce(0.3, scheduler: MainScheduler.instance).subscribe(onNext: {[unowned self] dynamicString in
            self.viewModel.dynamicSearchString.onNext(dynamicString)
        }).disposed(by: disposeBag)
    }
    
    private func setupNotificationObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector (keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func registerButtonTouchListeners(){
        self.doneButton.addTarget(self, action: #selector (self.closeScreen(_:)), for: UIControl.Event.touchUpInside)
        self.searchButton.addTarget(self, action: #selector (self.trigerSearchMaunaly(_:)), for: UIControl.Event.touchUpInside)
    }
 
    @objc func closeScreen(_ sender: UIButton){
        print("closeing SearchScreen")
        searchBarText.resignFirstResponder()
        self.coordinatorDelegate.viewHasFinished()
    }
    
    @objc func trigerSearchMaunaly(_ sender: UIButton){
        if let text = self.searchBarText.text{
            self.viewModel.dynamicSearchString.onNext(text)
        }
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
            self.settingsImage.alpha = isKeyboardShowing ? 1.0 : 0.0
            self.searchConteiner.alpha = isKeyboardShowing ? 1.0 : 0.0
            self.view.layoutIfNeeded()
        })
        if notification.name == UIResponder.keyboardWillHideNotification{
            self.coordinatorDelegate.viewHasFinished()
        }
    }
    
}
