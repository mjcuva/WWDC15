//
//  MasterScrollView.swift
//  WWDC15
//
//  Created by Marc Cuva on 4/22/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class MasterScrollView : UIViewController {
    
    var image : UIImage!
    var imageView : UIImageView!
    
    var blurImageView : UIImageView!
    var blurImage : UIImage!
    
    var titleLabel: BorderLabel!
    var bodyText: BorderLabel!
    
    var buttons = [UIView]()
    
    var open = false
    var frame = CGRectZero
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()
        
        image = UIImage(named: "IMG_0247.jpg")
        var aspectRatio = view.frame.size.width / image.size.width
        imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, view.frame.size.height * aspectRatio))
        imageView.image = image
        
        view.addSubview(imageView)
        
        titleLabel = BorderLabel(frame: CGRectMake(view.frame.size.width * 3/5, imageView.frame.size.height * 1/4, 400, 100))
        
        // Should load text from a file
        titleLabel.text = "Hello!"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(50)
        
        bodyText = BorderLabel(frame: CGRectMake(view.frame.size.width / 2, imageView.frame.size.height * 1/2, 400, 100))
        bodyText.font = UIFont.systemFontOfSize(25)
        bodyText.textColor = UIColor.whiteColor()
        bodyText.numberOfLines = 0
        bodyText.text = "This is the body. It needs to have text in it."
        
        view.addSubview(titleLabel)
        view.addSubview(bodyText)
        
        blurImageView = UIImageView(frame: CGRectMake(0, imageView.frame.size.height, view.frame.size.width, view.frame.size.height - imageView.frame.size.height))
        blurImage = image.stackBlur(400)
        blurImageView.image = blurImage;
        
        view.addSubview(blurImageView)
        
        buttons.append(UIView(frame: CGRectMake(0, blurImageView.frame.origin.y, view.frame.size.width / 2 - 2, blurImageView.frame.size.height / 2 - 2)))
        buttons.append(UIView(frame: CGRectMake(blurImageView.frame.size.width / 2 + 2, blurImageView.frame.origin.y, view.frame.size.width / 2 - 2, blurImageView.frame.size.height / 2 - 2)))
        buttons.append(UIView(frame: CGRectMake(0, blurImageView.frame.origin.y + blurImageView.frame.size.height / 2 + 2, view.frame.size.width / 2 - 2, blurImageView.frame.size.height / 2 - 2)))
        buttons.append(UIView(frame: CGRectMake(blurImageView.frame.size.width / 2 + 2, blurImageView.frame.origin.y + blurImageView.frame.size.height / 2 + 2, view.frame.size.width / 2 - 2, blurImageView.frame.size.height / 2 - 2)))
        
        for(var i = 0; i < 4; i++){
            buttons[i].backgroundColor = UIColor.whiteColor()
            buttons[i].alpha = 0.3
            
            var touch = UITapGestureRecognizer(target: self, action: "buttonClick:")
            buttons[i].addGestureRecognizer(touch)
            
            view.addSubview(buttons[i])
        }
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func buttonClick(sender : UITapGestureRecognizer){
        var button = sender.view!
        UIView.animateWithDuration(0.5, animations: {
            if(self.open){
                button.frame = self.frame
                button.alpha = 0.3
            }else{
                self.frame = button.frame
                button.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                button.alpha = 1
            }
            self.open = !self.open
            
        })
        
    }

}