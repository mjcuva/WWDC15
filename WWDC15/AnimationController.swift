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
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if(isOpening){
            growVC(transitionContext)
        }else{
            shrinkVC(transitionContext)
        }
    }
    
    func shrinkVC(transitionContext: UIViewControllerContextTransitioning){
        
    }
    
    func growVC(transitionContext: UIViewControllerContextTransitioning){
        
    }
   
}
