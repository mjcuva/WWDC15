//
//  InfoVC.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/23/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class InfoVC: UIViewController, UIViewControllerTransitioningDelegate {
    
    var start = CGRectZero
    var animationController = AnimationController()
    
    override func viewDidLoad() {
        setNeedsStatusBarAppearanceUpdate()
        
        var tap = UITapGestureRecognizer(target: self, action: "close")
        view.addGestureRecognizer(tap)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var end = segue.destinationViewController as! UIViewController
        end.transitioningDelegate = self;
    }
    
}
