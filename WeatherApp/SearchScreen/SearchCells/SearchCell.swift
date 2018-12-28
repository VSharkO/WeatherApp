//
//  SearchCell.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 28/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    let firstLetterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "square_checkmark_uncheck")
        return imageView
    }()
    
    let firstLetterTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.text = "T"
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textAlignment = .center
        textView.textColor = .white
        textView.backgroundColor = .clear
        return textView
    }()
    
    let cityNameText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.text = "TB Anakonda"
        textView.font = UIFont.systemFont(ofSize: 15)
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
        self.contentView.addSubview(firstLetterImageView)
        self.contentView.addSubview(separator)
        self.firstLetterImageView.addSubview(firstLetterTextView)
        self.contentView.addSubview(cityNameText)
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            firstLetterImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            firstLetterImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            firstLetterImageView.heightAnchor.constraint(equalToConstant: 50),
            firstLetterImageView.widthAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: firstLetterImageView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: firstLetterImageView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: firstLetterImageView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            firstLetterTextView.bottomAnchor.constraint(equalTo: firstLetterImageView.bottomAnchor),
            firstLetterTextView.leadingAnchor.constraint(equalTo: firstLetterImageView.leadingAnchor),
            firstLetterTextView.trailingAnchor.constraint(equalTo: firstLetterImageView.trailingAnchor),
            firstLetterTextView.topAnchor.constraint(equalTo: firstLetterImageView.topAnchor, constant: 7)
            ])
        
        NSLayoutConstraint.activate([
            cityNameText.bottomAnchor.constraint(equalTo: firstLetterImageView.bottomAnchor),
            cityNameText.leadingAnchor.constraint(equalTo: firstLetterImageView.trailingAnchor, constant: 10),
            cityNameText.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            cityNameText.topAnchor.constraint(equalTo: firstLetterImageView.topAnchor, constant: 7)
            ])
    }
    
}
