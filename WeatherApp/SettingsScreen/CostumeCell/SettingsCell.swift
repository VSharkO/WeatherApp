//
//  SettingsCell.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 03/01/2019.
//  Copyright © 2019 Valentin Šarić. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    var indexOfCell: Int!
    
    let checkBoxButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "square_checkmark_uncheck"), for: .normal)
        return button
    }()
    
    let textViewForX: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name:"GothamRounded-Book", size: 26)
        textView.textAlignment = .center
        textView.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.2)
        textView.text = "x"
        textView.backgroundColor = .clear
        return textView
    }()
    
    let cellText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont(name:"GothamRounded-Book", size: 15)
        textView.textAlignment = .left
        textView.textColor = .white
        textView.backgroundColor = .clear
        return textView
    }()
    
    let separator: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .clear
        return separator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.contentView.addSubview(checkBoxButton)
        self.contentView.addSubview(separator)
        self.checkBoxButton.addSubview(textViewForX)
        self.contentView.addSubview(cellText)
        setupConstraints()
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            checkBoxButton.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            checkBoxButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 50),
            checkBoxButton.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: checkBoxButton.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: checkBoxButton.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 2),
            separator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            textViewForX.bottomAnchor.constraint(equalTo: checkBoxButton.bottomAnchor),
            textViewForX.leadingAnchor.constraint(equalTo: checkBoxButton.leadingAnchor),
            textViewForX.trailingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor),
            textViewForX.topAnchor.constraint(equalTo: checkBoxButton.topAnchor, constant: 5)
            ])
        
        NSLayoutConstraint.activate([
            cellText.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cellText.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 10),
            cellText.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            cellText.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10)
            ])
    }
    
    func setCheckedUnits(units: UnitsType, index: Int){
        if (units == .si && index == 0) || (units == .us && index == 1){
            self.checkBoxButton.setBackgroundImage(UIImage(named: "square_checkmark_check"), for: .normal)
            self.textViewForX.text = ""
        }else{
            self.checkBoxButton.setBackgroundImage(UIImage(named: "square_checkmark_uncheck"), for: .normal)
            self.textViewForX.text = ""
        }
    }
    
    func appendCountryCode(countryCode: String?){
        if let code = countryCode{
            self.cellText.text.append(", "+code)
        }
    }
    
    func setUnitsText(index: Int){
      cellText.text = index == 0 ? Constants.unitsMetric : Constants.unitsImperial
    }
    
    func setButtonTag(tag: Int){
        self.checkBoxButton.tag = tag
    }
    
    func setDeleteClickListener(listener: SettingsViewController){
        checkBoxButton.addTarget(listener, action: #selector (listener.deleteCell(button:)), for: UIControl.Event.touchUpInside)
    }
    
}
