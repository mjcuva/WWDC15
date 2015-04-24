//
//  ViewController.swift
//  WWDC15
//
//  Created by Marc Cuva on 3/5/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var mainImageView: UIImageView!
    var halfBlurredImageView: UIImageView!
    var fullBlurredImageView: UIImageView!
    
    var image: UIImage!
    
//    var titleLabel: BorderLabel!
//    var bodyText: BorderLabel!
    
    var sv: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var mainFrame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
//        mainImageView = UIImageView(frame: mainFrame)
//        image = UIImage(named: "IMG_0247.jpg")
//        mainImageView.image = image
//        mainImageView.contentMode = UIViewContentMode.ScaleAspectFill
//        
//        var halfBlurredImage = image.stackBlur(45)
//        halfBlurredImageView = UIImageView(frame: mainFrame)
//        halfBlurredImageView.image = halfBlurredImage
//        halfBlurredImageView.contentMode = UIViewContentMode.ScaleAspectFill
//
//        var fullBlurredImage = image.stackBlur(90)
//        fullBlurredImageView = UIImageView(frame: mainFrame)
//        fullBlurredImageView.image = fullBlurredImage
//        fullBlurredImageView.contentMode = UIViewContentMode.ScaleAspectFill
//        
//        view.addSubview(fullBlurredImageView)
//        view.addSubview(halfBlurredImageView)
//        view.addSubview(mainImageView)
//        
//        
//        sv = UIScrollView(frame: view.frame)
//        sv.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height * 3/2)
////        sv.addSubview(titleLabel)
////        sv.addSubview(bodyText)
//        sv.delegate = self
//        
//        view.addSubview(sv)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y
        var scrollViewHeight = scrollView.frame.size.height
        var scrollContentSizeHeight = scrollView.contentSize.height
        
        if(offset < view.frame.size.height / 3){
            mainImageView.alpha = 1 - (offset / (view.frame.size.height / 3))
        }else if(offset < view.frame.size.height){
            halfBlurredImageView.alpha = 1 - (offset / view.frame.size.height)
        }
    }

}

