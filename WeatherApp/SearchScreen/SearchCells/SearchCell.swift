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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.contentView.addSubview(firstLetterImageView)
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            firstLetterImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            firstLetterImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            firstLetterImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            firstLetterImageView.widthAnchor.constraint(equalToConstant: 30)
            ])
    }
    
}
