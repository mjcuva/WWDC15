//
//  ButtonView.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/25/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class ButtonView: UIView {
    
    private var _image : UIImage!
    private var _title : String!
    private var _color : UIColor!
    
    var imageView : UIImageView!
    private var titleLabel : UILabel!
    private var overlay : UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        addSubview(imageView)
        
        overlay = UIView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        overlay.alpha = 0.75
        
        addSubview(overlay)
        
        
        titleLabel = UILabel(frame: CGRectMake(0, frame.size.height / 2, frame.size.width, 30))
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.font = UIFont.systemFontOfSize(35)
        titleLabel.textColor = UIColor.whiteColor()
        
        addSubview(titleLabel)
        
    }
    
    func setImage(image : UIImage){
        _image = image
        imageView.image = _image
    }
    
    func setTitle(title : String){
        _title = title
        titleLabel.text = _title
    }
    
    func setColor(color : UIColor){
        _color = color
        overlay.backgroundColor = color
    }
    
    func getImage() -> UIImage{
        return _image
    }
    
    func getTitle() -> String {
        return _title
    }
    
    func getColor() -> UIColor {
        return _color
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
