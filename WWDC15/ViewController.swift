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
    
    var titleLabel: UILabel!
    
    var sv: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setNeedsStatusBarAppearanceUpdate()
        
        var mainFrame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        mainImageView = UIImageView(frame: mainFrame)
        image = UIImage(named: "IMG_0247.jpg")
        mainImageView.image = image
        mainImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        var halfBlurredImage = image.stackBlur(45)
        halfBlurredImageView = UIImageView(frame: mainFrame)
        halfBlurredImageView.image = halfBlurredImage
        halfBlurredImageView.contentMode = UIViewContentMode.ScaleAspectFill

        var fullBlurredImage = image.stackBlur(90)
        fullBlurredImageView = UIImageView(frame: mainFrame)
        fullBlurredImageView.image = fullBlurredImage
        fullBlurredImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        view.addSubview(fullBlurredImageView)
        view.addSubview(halfBlurredImageView)
        view.addSubview(mainImageView)
        
        titleLabel = BorderLabel(frame: CGRectMake(view.frame.size.width * 3/5, view.frame.size.height * 1/2, 400, 100))
        titleLabel.text = "Hello!"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(50)
        
        sv = UIScrollView(frame: view.frame)
        sv.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height * 3/2)
        sv.addSubview(titleLabel)
        sv.delegate = self
        
        view.addSubview(sv)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y
        
        if(offset < view.frame.size.height / 3){
            mainImageView.alpha = 1 - (offset / (view.frame.size.height / 3))
        }else if(offset < view.frame.size.height){
            halfBlurredImageView.alpha = 1 - (offset / view.frame.size.height)
        }
        
    }

}

