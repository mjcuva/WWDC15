//
//  EducationVC.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/24/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class EducationVC: InfoVC, ScrollingViewProtocol {
    
    var mainImageView : UIImageView!
    var fullBlurredImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainFrame = CGRectMake(0, 0, self.view.frame.size.width, 500)
        
        let image = UIImage(named: "umn.jpg")!
        mainImageView = UIImageView(frame: mainFrame)
        mainImageView.image = image
        
        let fullBlurredImage = image.stackBlur(180)
        fullBlurredImageView = UIImageView(frame: mainFrame)
        fullBlurredImageView.image = fullBlurredImage
        
        view.addSubview(fullBlurredImageView)
        view.addSubview(mainImageView)
        
        var sv = ScrollingView(frame: CGRectMake(0, 500, view.frame.size.width, 100))
        
        var num1 = HTMLFileDisplayer(contentsOfFile: "education", andFrame: CGRectMake(20, 0, view.frame.size.width - 20, 0))
        num1.sizeToFitHeight()
        
        sv.addSubview(num1)
        sv.delegate = self
        
        view.addSubview(sv)


    }
    
    func didScroll(scroller: ScrollingView) {
        let offset = scroller.offset
        var scrollViewHeight = scroller.frame.size.height
        mainImageView.alpha = 1 - (offset / (scrollViewHeight / 5))
    }

}
