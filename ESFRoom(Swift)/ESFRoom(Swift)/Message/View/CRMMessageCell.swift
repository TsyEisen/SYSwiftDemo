//
//  CRMMessageCell.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/7/6.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class CRMMessageCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
