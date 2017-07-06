//
//  CRMMessageViewController.swift
//  ESFRoom(Swift)
//
//  Created by 唐绍禹 on 2017/7/2.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class CRMMessageViewController: SYBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    lazy var datas = [["icon":"message_notification","title":"通知"],["icon":"message_remind","title":"提醒"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sy_registerNib(cellclass: CRMMessageCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CRMMessageCell.sy_classNameString) as! CRMMessageCell
        let dict = datas[indexPath.row]
        cell.nameLabel.text = dict["title"]
        cell.iconImageView.image = UIImage(named: dict["icon"]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}
