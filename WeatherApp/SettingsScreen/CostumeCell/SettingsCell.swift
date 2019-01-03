//
//  SettingsCell.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 03/01/2019.
//  Copyright © 2019 Valentin Šarić. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    let checkBoxImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "square_checkmark_uncheck")
        return imageView
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
    
    let cityNameText: UITextView = {
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
        self.contentView.addSubview(checkBoxImageView)
        self.contentView.addSubview(separator)
        self.checkBoxImageView.addSubview(textViewForX)
        self.contentView.addSubview(cityNameText)
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            checkBoxImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            checkBoxImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            checkBoxImageView.heightAnchor.constraint(equalToConstant: 50),
            checkBoxImageView.widthAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: checkBoxImageView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: checkBoxImageView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: checkBoxImageView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            textViewForX.bottomAnchor.constraint(equalTo: checkBoxImageView.bottomAnchor),
            textViewForX.leadingAnchor.constraint(equalTo: checkBoxImageView.leadingAnchor),
            textViewForX.trailingAnchor.constraint(equalTo: checkBoxImageView.trailingAnchor),
            textViewForX.topAnchor.constraint(equalTo: checkBoxImageView.topAnchor, constant: 5)
            ])
        
        NSLayoutConstraint.activate([
            cityNameText.bottomAnchor.constraint(equalTo: checkBoxImageView.bottomAnchor),
            cityNameText.leadingAnchor.constraint(equalTo: checkBoxImageView.trailingAnchor, constant: 10),
            cityNameText.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            cityNameText.centerYAnchor.constraint(equalTo: checkBoxImageView.centerYAnchor)
            ])
    }
    
    
}
