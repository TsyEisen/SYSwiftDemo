//
//  CRMWorkBenchCell.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/7/5.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class CRMWorkBenchCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
    }
    
    var dataDict:Dictionary<String, String>?{
        didSet {
            if let icon = dataDict!["icon"] {
                iconImageView.image = UIImage(named:icon)
            }
            if let title = dataDict!["title"] {
                nameLabel.text = title
            }
            if let des = dataDict!["des"] {
                desLabel.text = des
            }
        }
    }
    
}
