//
//  AnimationHelper.swift
//  WeatherApp
//
//  Created by Valentin Šarić on 27/12/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class AnimationHelperAppearing:  NSObject, UIViewControllerAnimatedTransitioning{
    
    let duration = 0.2
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
        UIView.animate(withDuration: duration, animations: {
        }) { isFinished in
            transitionContext.completeTransition(isFinished)
        }
    }
    
}
