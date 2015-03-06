//
//  BorderLabel.swift
//  WWDC15
//
//  Created by Marc Cuva on 3/5/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import UIKit

class BorderLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSizeMake(0.0, 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1.0
        
    }
}
