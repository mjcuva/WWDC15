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
    
    var clickedButton : ButtonView!
    
    var transitionContext : UIViewControllerContextTransitioning!
    
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
        self.transitionContext = transitionContext
        
        let fromViewController : UIViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let destinationController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!

        transitionContext.containerView().addSubview(destinationController.view)
        transitionContext.containerView().addSubview(fromViewController.view)
        
        var maskPath = UIBezierPath(ovalInRect: CGRectMake(-fromViewController.view.frame.size.width/2, -fromViewController.view.frame.size.height/2, fromViewController.view.frame.size.height*2, fromViewController.view.frame.size.height*2))

        var maskLayer = CAShapeLayer()
        maskLayer.frame = fromViewController.view.frame;
        maskLayer.path = maskPath.CGPath;
        fromViewController.view.layer.mask = maskLayer;
        

        var newPath = UIBezierPath(ovalInRect: clickedButton.frame)
        var pathAnim = CABasicAnimation(keyPath: "path")
        pathAnim.fromValue = maskPath.CGPath
        pathAnim.toValue = newPath.CGPath
        pathAnim.delegate = self
        pathAnim.duration = transitionDuration(transitionContext)
        maskLayer.path = newPath.CGPath
        maskLayer.addAnimation(pathAnim, forKey: "path")
    }
    
    func growVC(transitionContext: UIViewControllerContextTransitioning){
        self.transitionContext = transitionContext
        
        let fromViewController : UIViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let destinationController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let destinationView = destinationController.view
        
        let containerView = transitionContext.containerView()
        
        containerView.addSubview(destinationController.view)
        
        let buttonFrame = clickedButton.frame
        let endFrame = CGRectMake(-CGRectGetWidth(destinationView.frame)/2, -CGRectGetHeight(destinationView.frame)/2, CGRectGetWidth(destinationView.frame)*2, CGRectGetHeight(destinationView.frame)*2)
        
        containerView.addSubview(fromViewController.view)
        containerView.addSubview(destinationView)
        
        var maskPath = UIBezierPath(ovalInRect: buttonFrame)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = destinationView.frame
        maskLayer.path = maskPath.CGPath
        destinationController.view.layer.mask = maskLayer
        
        let bigCirclePath = UIBezierPath(ovalInRect: endFrame)
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.delegate = self
        pathAnimation.fromValue = maskPath.CGPath
        pathAnimation.toValue = bigCirclePath
        pathAnimation.duration = transitionDuration(transitionContext)
        maskLayer.path = bigCirclePath.CGPath
        maskLayer.addAnimation(pathAnimation, forKey: "pathAnimation")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if let transitionContext = self.transitionContext {
            transitionContext.completeTransition(true)
        }
    }
   
}
