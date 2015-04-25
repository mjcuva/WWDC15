//
//  MasterScrollView.swift
//  WWDC15
//
//  Created by Marc Cuva on 4/22/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class MasterVC : UIViewController, UIViewControllerTransitioningDelegate {
    
    var image : UIImage!
    var imageView : UIImageView!
    
    var blurImageView : UIImageView!
    var blurImage : UIImage!
    
    var titleLabel: BorderLabel!
    var bodyText: BorderLabel!
    
    var buttons = [ButtonView]()
    
    var animationController = AnimationController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setNeedsStatusBarAppearanceUpdate()
        
        image = UIImage(named: "IMG_0247.jpg")
        var aspectRatio = view.frame.size.width / image.size.width
        imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, view.frame.size.height * aspectRatio))
        imageView.image = image
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        
        titleLabel = BorderLabel(frame: CGRectMake(view.frame.size.width * 3/5, imageView.frame.size.height * 1/5, 400, 100))
        
        // Should load text from a file
        titleLabel.text = "Hello!"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(50)
        
        bodyText = BorderLabel(frame: CGRectMake(view.frame.size.width / 2 - 30, imageView.frame.size.height * 1/2 - 20, 400, 100))
        bodyText.font = UIFont.systemFontOfSize(25)
        bodyText.textColor = UIColor.whiteColor()
        bodyText.numberOfLines = 0
        bodyText.text = "I'm Marc Cuva, a Computer Science sophomore at the University of Minnesota."
        
        view.addSubview(titleLabel)
        view.addSubview(bodyText)
        
        blurImageView = UIImageView(frame: CGRectMake(0, imageView.frame.size.height, view.frame.size.width, view.frame.size.height - imageView.frame.size.height))
        blurImage = image.stackBlur(400)
        blurImageView.image = blurImage;
        
        view.addSubview(blurImageView)
        
        let buttonSize = CGSizeMake(view.frame.size.width / 2, blurImageView.frame.size.height / 2)
        
        buttons.append(ButtonView(frame: CGRectMake(0, blurImageView.frame.origin.y, buttonSize.width, buttonSize.height)))
        buttons.append(ButtonView(frame: CGRectMake(blurImageView.frame.size.width / 2, blurImageView.frame.origin.y, buttonSize.width, buttonSize.height)))
        buttons.append(ButtonView(frame: CGRectMake(0, blurImageView.frame.origin.y + blurImageView.frame.size.height / 2, buttonSize.width, buttonSize.height)))
        buttons.append(ButtonView(frame: CGRectMake(blurImageView.frame.size.width / 2, blurImageView.frame.origin.y + blurImageView.frame.size.height / 2, buttonSize.width, buttonSize.height)))
    

        
        var colors = [ORANGE_COLOR, LIGHT_BLUE_COLOR, BLUE_COLOR, RED_COLOR]
        var images = ["Thomson-Reuters.jpg", "umn.jpg", "hidrate.png", "lighthouse.jpg"]
        var buttonText = ["Work Experience", "Education", "Accomplishments", "Skills & Interests"]
        
        for(var i = 0; i < buttons.count; i++){
            
            var image = UIImage(named: images[i])?.stackBlur(10)
            buttons[i].setImage(image!)
            
            buttons[i].setTitle(buttonText[i])
            
            buttons[i].setColor(colors[i])
            
            var touch = UITapGestureRecognizer(target: self, action: "buttonClick:")
            buttons[i].addGestureRecognizer(touch)
            buttons[i].tag = i
            
            view.addSubview(buttons[i])
        }
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func buttonClick(sender : UITapGestureRecognizer){
        var button = sender.view!
        animationController.startFrame = button.frame
        animationController.transitionFrame = CGRectMake(0,0, view.frame.size.width, view.frame.height)
        animationController.clickedButton = buttons[button.tag]
        
        switch button.tag{
        case 0:
            performSegueWithIdentifier("Work", sender: self)
        case 1:
            performSegueWithIdentifier("Education", sender: self)
        case 2: 
            performSegueWithIdentifier("Projects", sender: self)
        case 3:
            performSegueWithIdentifier("Skills", sender: self)
        default:
            NSLog("Shouldn't get here...")
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var end =  segue.destinationViewController as! InfoVC
        end.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animationController.isOpening = true
        return animationController
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animationController.isOpening = false
        return animationController
    }
    
    

}
