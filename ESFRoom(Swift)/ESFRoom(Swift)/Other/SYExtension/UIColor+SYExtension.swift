//
//  UIColor+SYExtension.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/29.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(rgb:UInt,alpha:CGFloat = 1.0) {
        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 256.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 256.0, blue:CGFloat(rgb & 0x0000FF) / 256.0, alpha: alpha)
    }
    
    class func appMainColor() -> UIColor {
//        return UIColor(red: 0, green: 180.0/255.0, blue: 1, alpha: 1)
        return UIColor(rgb: 0x00B4FF)
    }
    
}
