//
//  CRMWorkBenchViewController.swift
//  ESFRoom(Swift)
//
//  Created by 唐绍禹 on 2017/7/1.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class CRMWorkBenchViewController: SYBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    let datas = [
                        ["title":"客户公海","des":"可领取网库提供的客户资源!","icon":"workBench_common"],
                        ["title":"联系人","des":"快速查找联系人，拨打电话!","icon":"workBench_link"],
                        ["title":"跟进记录","des":"选择客户，填写跟进记录!","icon":"workBench_follow"]
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CRM"
        topView.backgroundColor = UIColor.appMainColor
        tableView.sy_registerNib(cellclass: CRMWorkBenchCell.self)
    }
    
    /// 线索客户
    @IBAction func threadClient() {
        print("线索客户")
    }
    
    @IBAction func signClient() {
        print("签约客户")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CRMWorkBenchCell.sy_classNameString) as! CRMWorkBenchCell
        cell.dataDict = datas[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击cell")
    }
}
