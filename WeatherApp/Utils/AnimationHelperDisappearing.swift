//
//  AnimationHelperDisappearing.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 28/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class AnimationHelperDisappearing:  NSObject, UIViewControllerAnimatedTransitioning{
    
    let duration = 0.25
    var originFrame = CGRect.zero
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from)else{
            return
        }
        let containerView = transitionContext.containerView
        containerView.addSubview(fromView)
        fromView.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            fromView.alpha = 0.95
        }) { isFinished in
            transitionContext.completeTransition(isFinished)
        }
    }
    
}
