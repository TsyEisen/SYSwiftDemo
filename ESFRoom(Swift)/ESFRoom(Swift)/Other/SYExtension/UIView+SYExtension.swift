//
//  UIView+SYExtension.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/7/6.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit
import ObjectiveC

extension UIView {
    var sy_x:CGFloat {
        get {
            return frame.origin.x
        }
        set{
            var rect = frame
            rect.origin.x = newValue
            frame = rect
        }
    }
    
    var sy_y:CGFloat {
        get {
            return frame.origin.y
        }
        set{
            var rect = frame
            rect.origin.y = newValue
            frame = rect
        }
    }
        
    var sy_width:CGFloat {
        get {
            return frame.size.width
        }
        set{
            var rect = frame
            rect.size.width = newValue
            frame = rect
        }
    }
        
    var sy_height:CGFloat {
        get {
            return frame.size.height
        }
        set{
            var rect = frame
            rect.size.height = newValue
            frame = rect
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor:UIColor {
        
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth:CGFloat {
        
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
}
