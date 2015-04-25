//
//  ProjectsVC.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/24/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class ProjectsVC: InfoVC, ScrollingViewProtocol {

    var mainImageView : UIImageView!
    var fullBlurredImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainFrame = CGRectMake(0, 0, self.view.frame.size.width, 315)
        
        let image = UIImage(named: "hidrate.png")!
        mainImageView = UIImageView(frame: mainFrame)
        mainImageView.image = image
        
        let fullBlurredImage = image.stackBlur(180)
        fullBlurredImageView = UIImageView(frame: mainFrame)
        fullBlurredImageView.image = fullBlurredImage
        
        view.addSubview(fullBlurredImageView)
        view.addSubview(mainImageView)
        
        var sv = ScrollingView(frame: CGRectMake(0, 315, view.frame.size.width, 100))
        
        var num1 = HTMLFileDisplayer(contentsOfFile: "projects", andFrame: CGRectMake(0, 0, view.frame.size.width, 0))
        num1.sizeToFitHeight()
        
        var v = UIView(frame: CGRectMake(0, num1.frame.size.height, view.frame.size.width, 1000))
        v.backgroundColor = UIColor.redColor()
        
        sv.addSubview(num1)
        sv.addSubview(v)
        sv.delegate = self
        
        view.addSubview(sv)
        
        
    }
    
    func didScroll(scroller: ScrollingView) {
        let offset = scroller.offset
        var scrollViewHeight = scroller.frame.size.height
        mainImageView.alpha = 1 - (offset / (view.frame.size.height / 5))
    }

}
