//
//  ProjectsVC.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/24/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class SkillsVC: InfoVC, ScrollingViewProtocol {
    
    var mainImageView : UIImageView!
    var fullBlurredImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainFrame = CGRectMake(0, 0, self.view.frame.size.width, 500)
        
        let image = UIImage(named: "lighthouse.jpg")!
        mainImageView = UIImageView(frame: CGRectMake(0, 0, image.size.width, image.size.height))
        mainImageView.image = image
        
        let fullBlurredImage = image.stackBlur(180)
        fullBlurredImageView = UIImageView(frame: mainFrame)
        fullBlurredImageView.image = fullBlurredImage
        
        view.addSubview(fullBlurredImageView)
        view.addSubview(mainImageView)
        
        var sv = ScrollingView(frame: CGRectMake(0, 500, view.frame.size.width, 100))
        
        var num1 = HTMLFileDisplayer(contentsOfFile: "skills", andFrame: CGRectMake(20, 0, view.frame.size.width - 40, 0))
        num1.sizeToFitHeight()
        
        sv.addSubview(num1)
        
        var runningHeight = num1.frame.size.height
        
        let width = Int(view.frame.size.width / 4)
        for(var i = 0; i < 8; i++){
            var mult = i
            var row = 0
            if(i > 3){
                mult = i % 4
                row = 1
            }
            var img = UIImage(named: "\(i).jpg")
            var imageView = UIImageView(frame: CGRectMake(CGFloat(width * mult), runningHeight + CGFloat(width * row), CGFloat(width), CGFloat(width)))
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = img
            sv.addSubview(imageView)
        }
        
        runningHeight += CGFloat(width * 2 + 10)
        
        var num2 = HTMLFileDisplayer(contentsOfFile: "skills2", andFrame: CGRectMake(20, runningHeight, view.frame.size.width - 40, 0))
        num2.sizeToFitHeight()

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
