//
//  SYNavigationController.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/27.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class SYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor.appMainColor()
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue:UIColor.white,NSAttributedStringKey.font.rawValue:UIFont.systemFont(ofSize: 17)]
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
        
    }
}
