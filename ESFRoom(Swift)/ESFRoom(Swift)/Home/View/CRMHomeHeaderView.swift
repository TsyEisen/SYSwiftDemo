//
//  CRMHomeHeaderView.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/29.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit
import Foundation

class CRMHomeHeaderView: UIView {

    static func viewFromNib() -> CRMHomeHeaderView? {
        return Bundle.main.loadNibNamed("CRMHomeHeaderView", owner: self, options: nil)?.last as? CRMHomeHeaderView
    }
}
