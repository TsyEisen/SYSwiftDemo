//
//  NSObject+SYExtension.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/29.
//  Copyright © 2017年 tsy. All rights reserved.
//

import Foundation

extension NSObject {
    class func sy_classNameString() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
