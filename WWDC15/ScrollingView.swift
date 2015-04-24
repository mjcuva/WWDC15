//
//  ScrollingView.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/23/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

protocol ScrollingViewProtocol{
    func didScroll(scroller : ScrollingView)
}

class ScrollingView: UIView, DecelerationBehaviourTarget {
    
    var panGesture : UIPanGestureRecognizer!
    var offset : CGFloat = 0
    var direction : Int!
    var startingY : CGFloat!
    
    var db : DecelerationBehaviour!
    
    var delegate : ScrollingViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        panGesture = UIPanGestureRecognizer(target: self, action: "scrolled:")
        addGestureRecognizer(panGesture)
        
        startingY = frame.origin.y
        
        db = DecelerationBehaviour(target: self)
        db.smoothnessFactor = 0.7
        
            
    }
    
    func scrolled(recognizer: UIPanGestureRecognizer){
        if(recognizer.state == UIGestureRecognizerState.Ended || 
            recognizer.state == UIGestureRecognizerState.Failed || 
            recognizer.state == UIGestureRecognizerState.Cancelled){
                db.decelerateWithVelocity(recognizer.velocityInView(self), withCompletionBlock: nil)
        }else{
            var translation = recognizer.translationInView(self)
            addTranslation(translation)
            recognizer.setTranslation(CGPointZero, inView: self)
        }
    }
    
    override func addSubview(view: UIView) {
        super.addSubview(view)
        sizeToFit()
    }
    
    override func sizeToFit() {
        var w : CGFloat = 0.0
        var h : CGFloat = 0.0
        
        for v in self.subviews as! [UIView] {
            var fw = v.frame.origin.x + v.frame.size.width
            var fh = v.frame.origin.y + v.frame.size.height
            w = max(fw, w)
            h = max(fh, h)
        }
        
        frame = CGRectMake(frame.origin.x, frame.origin.y, w, h)
    }
    
    func addTranslation(translation : CGPoint){
        var newY = frame.origin.y + translation.y
        offset -= translation.y
        direction = (translation.y < 0) ? -1 : 1
        if(offset < 0){
            offset = 0
        }else if(offset > frame.size.height){
            offset = frame.size.height
        }
        if(newY + frame.size.height < superview!.frame.size.height){
            newY = superview!.frame.size.height - frame.size.height
        }else if(newY > startingY){
            newY = startingY
        }
        frame = CGRectMake(frame.origin.x, newY, frame.size.width, frame.size.height)
        
        if let d = delegate {
            d.didScroll(self)
        }
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
}
