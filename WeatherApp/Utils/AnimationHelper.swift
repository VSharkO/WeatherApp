//
//  AnimationHelper.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class AnimationHelper:  NSObject, UIViewControllerAnimatedTransitioning{
    
    let duration = 0.5
    var originFrame = CGRect.zero
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to)else{
            return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = containerView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        toView.alpha = 0.7
        
        UIView.animate(withDuration: duration,
                       animations: {
                        toView.alpha = 1.0
                        containerView.insertSubview(blurEffectView, at: 0)
        })
    }
    
}
