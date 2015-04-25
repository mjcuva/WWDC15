//
//  WorkVC.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/23/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit
import MapKit

class WorkVC: InfoVC, ScrollingViewProtocol {
    
    var mainImageView : UIImageView!
    var fullBlurredImageView : UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainFrame = CGRectMake(0, 0, view.frame.size.width, 360)
        
        let image = UIImage(named: "Thomson-Reuters.jpg")!
        mainImageView = UIImageView(frame: mainFrame)
        mainImageView.image = image
        
        let fullBlurredImage = image.stackBlur(180)
        fullBlurredImageView = UIImageView(frame: mainFrame)
        fullBlurredImageView.image = fullBlurredImage
        
        view.addSubview(fullBlurredImageView)
        view.addSubview(mainImageView)
        
        var sv = ScrollingView(frame: CGRectMake(0, 360, view.frame.size.width, 100))
        
        var runningHeight : CGFloat = 0
        
        var num1 = HTMLFileDisplayer(contentsOfFile: "work", andFrame: CGRectMake(20, 0, view.frame.size.width - 20, 0))
        num1.sizeToFitHeight()
        
        runningHeight += num1.frame.size.height + 20
        
        let esImage = UIImage(named: "es.png")!
        let ratio = view.frame.size.width/esImage.size.width;
        let height = esImage.size.height*ratio;
        let esImageView = UIImageView(frame: CGRectMake(0, runningHeight, view.frame.size.width, height))
        esImageView.backgroundColor = UIColor(white: 0.5, alpha: 0.7)
        esImageView.image = esImage
        
        runningHeight += esImageView.frame.size.height
        
        var num2 = HTMLFileDisplayer(contentsOfFile: "work2", andFrame: CGRectMake(20, runningHeight, view.frame.size.width - 20, 0))
        num2.sizeToFitHeight()
        
        
        sv.addSubview(num1)
        sv.addSubview(esImageView)
        sv.addSubview(num2)
        sv.delegate = self
        
        view.addSubview(sv)

    }
    
    func didScroll(scroller: ScrollingView) {
        let offset = scroller.offset
        var scrollViewHeight = scroller.frame.size.height
        mainImageView.alpha = 1 - (offset / (scrollViewHeight / 5))
    }
    

    
    
}