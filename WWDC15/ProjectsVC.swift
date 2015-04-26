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
        
        setNeedsStatusBarAppearanceUpdate()
        
        let mainFrame = CGRectMake(0, 0, self.view.frame.size.width, 450)
        
        let image = UIImage(named: "wwdc14.jpg")!
        mainImageView = UIImageView(frame: mainFrame)
        mainImageView.image = image
        
        let fullBlurredImage = image.stackBlur(180)
        fullBlurredImageView = UIImageView(frame: mainFrame)
        fullBlurredImageView.image = fullBlurredImage
        
        view.addSubview(fullBlurredImageView)
        view.addSubview(mainImageView)
        
        var sv = ScrollingView(frame: CGRectMake(0, 450, view.frame.size.width, 100))
        
        var runningHeight :CGFloat = 0
        
        var num1 = HTMLFileDisplayer(contentsOfFile: "projects", andFrame: CGRectMake(20, 0, view.frame.size.width - 40, 0))
        num1.sizeToFitHeight()
        
        runningHeight += num1.frame.size.height - 30
        
        let hidrateImage = UIImage(named: "hidrate.jpg")!
        let hidrateSize = CGSizeMake(hidrateImage.size.width / 2, hidrateImage.size.height / 2)
        var hidrateIV = UIImageView(frame: CGRectMake(view.frame.size.width - hidrateSize.width, runningHeight, hidrateSize.width, hidrateSize.height))
        hidrateIV.image = hidrateImage
        
        
        var num2 = HTMLFileDisplayer(contentsOfFile: "projects2", andFrame: CGRectMake(20, runningHeight, view.frame.size.width - hidrateSize.width - 20, 0))
        num2.sizeToFitHeight()
        
        runningHeight += max(num2.frame.size.height - 30, hidrateIV.frame.size.height - 30) + 30
        
        
        let cwImage = UIImage(named: "connectedwire.png")!
        let ratio = view.frame.size.width/cwImage.size.width
        let height = cwImage.size.height * ratio
        let cwImageView = UIImageView(frame: CGRectMake(0, runningHeight, view.frame.size.width, height))
        cwImageView.image = cwImage
        
        runningHeight += cwImageView.frame.size.height
        
        let num3 = HTMLFileDisplayer(contentsOfFile: "projects3", andFrame: CGRectMake(20, runningHeight, view.frame.size.width - 20, 0))
        num3.sizeToFitHeight()
        
        sv.addSubview(num1)
        sv.addSubview(hidrateIV)
        sv.addSubview(num2)
        sv.addSubview(cwImageView)
        sv.addSubview(num3)
        
        sv.delegate = self
        
        view.addSubview(sv)
        
        
    }
    
    // White background in this vc
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.Default
    }
    
    func didScroll(scroller: ScrollingView) {
        let offset = scroller.offset
        var scrollViewHeight = scroller.frame.size.height
        mainImageView.alpha = 1 - (offset / (scrollViewHeight / 5))
    }

}
