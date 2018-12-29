//
//  LoaderManager.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 19/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

protocol LoaderManager{
    func displayLoader(onView : UIView, backgroundColor: UIColor?) -> UIView
    func removeLoader(loader :UIView)
}

extension LoaderManager {
    func displayLoader(onView : UIView, backgroundColor: UIColor?) -> UIView {
        let loaderView = UIView.init(frame: onView.bounds)
        if let hasBackground = backgroundColor{
            loaderView.backgroundColor = hasBackground
        }else{
            loaderView.backgroundColor = UIColor(hex: "234880")
        }
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = loaderView.center
        
        DispatchQueue.main.async {
            loaderView.addSubview(ai)
            onView.addSubview(loaderView)
        }
        
        return loaderView
    }
    
    func removeLoader(loader: UIView) {
        DispatchQueue.main.async {
            loader.removeFromSuperview()
        }
    }
}
