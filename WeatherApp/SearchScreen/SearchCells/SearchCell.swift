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
    }
    
}
