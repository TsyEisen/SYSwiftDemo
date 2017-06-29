//
//  UITableView+SYExtension.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/29.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

extension UITableView {
    
    func sy_registerNib(cellclass:UITableViewCell.Type) {
        let name = NSStringFromClass(cellclass).components(separatedBy: ".").last!
        let nib = UINib(nibName:name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
}
