//
//  AnimationController.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/23/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isOpening = false
    
    var startFrame = CGRectZero
    var transitionFrame = CGRectZero
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if(isOpening){
            growVC(transitionContext)
        }else{
            shrinkVC(transitionContext)
        }
    }
    
    func shrinkVC(transitionContext: UIViewControllerContextTransitioning){
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        toViewController.view.frame = transitionFrame
        transitionContext.containerView().addSubview(toViewController.view)
        transitionContext.containerView().sendSubviewToBack(toViewController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            fromViewController.view.frame = self.startFrame;
            fromViewController.view.alpha = 0.3
        }, completion: { (Bool) in
            fromViewController.removeFromParentViewController()
            transitionContext.completeTransition(true)
        })
    }
    
    func growVC(transitionContext: UIViewControllerContextTransitioning){
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        toViewController.view.frame = startFrame;
        transitionContext.containerView().addSubview(toViewController.view)
        toViewController.view.alpha = 0.3
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            toViewController.view.frame = self.transitionFrame
            toViewController.view.alpha = 1
        }, completion: { (Bool) in
            transitionContext.completeTransition(true)
        })
    }
   
}
