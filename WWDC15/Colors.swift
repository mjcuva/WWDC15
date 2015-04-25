//
//  Colors.swift
//  Marc Cuva
//
//  Created by Marc Cuva on 4/25/15.
//  Copyright (c) 2015 cuva. All rights reserved.
//

import Foundation

// Borrowed from http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

let ORANGE_COLOR = UIColor(red: 0xef, green: 0x5f, blue: 0x3c)

let BLUE_COLOR = UIColor(red: 0x40, green: 0x40, blue: 0x40)

let LIGHT_BLUE_COLOR = UIColor(red: 0x56, green: 0xac, blue: 0xab)

let RED_COLOR = UIColor(red: 0xcf, green: 0x06, blue: 0x21)