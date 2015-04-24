//
//  WorkVC.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/23/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class WorkVC: InfoVC, UIViewControllerTransitioningDelegate, ScrollingViewProtocol {
    
    var animationController = AnimationController()
    
    var mainImageView : UIImageView!
    var halfBlurredImageView : UIImageView!
    var fullBlurredImageView : UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap = UITapGestureRecognizer(target: self, action: "close")
        view.addGestureRecognizer(tap)
        
        let mainFrame = CGRectMake(0, 0, self.view.frame.size.width, 500)
        
        let image = UIImage(named: "IMG_0247.jpg")!
        mainImageView = UIImageView(frame: mainFrame)
        mainImageView.image = image
        
        let fullBlurredImage = image.stackBlur(180)
        fullBlurredImageView = UIImageView(frame: mainFrame)
        fullBlurredImageView.image = fullBlurredImage
        
        view.addSubview(fullBlurredImageView)
        view.addSubview(mainImageView)
        
        var sv = ScrollingView(frame: CGRectMake(0, 500, view.frame.size.width, 100))
        
        var v = UIView(frame: CGRectMake(0, 0, view.frame.size.width, 1000))
        v.backgroundColor = UIColor.redColor()
        
        sv.addSubview(v)
        sv.delegate = self
        
        view.addSubview(sv)

    }
    
    func didScroll(scroller: ScrollingView) {
        let offset = scroller.offset
        var scrollViewHeight = scroller.frame.size.height
        mainImageView.alpha = 1 - (offset / (view.frame.size.height / 5))
    }
    
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var end = segue.destinationViewController as! UIViewController
        end.transitioningDelegate = self;
    }
    
    
}