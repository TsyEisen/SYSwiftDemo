//
//  SYHomeViewController.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/27.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class SYHomeViewController: SYBaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var datas:Array<Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        
        let request = SYRequest()
        request.url = "/crm/getAddressBookList"
        request.params = ["loginCode":"WK_CRMUSER_1498198966577918_4123300087201797"]
        
        SYNetworkTool.sharedTool.requestData(requestModel: request) { (result, error) in
            if error == nil {
                print(result)
                self.datas = result["list"] as? Array<Any>
                self.tableView.reloadData()
            }else {
                //处理错误
            }
        }
    }
    
    //MARK:-UITableView数据源
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas == nil ? 0:datas!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let model = datas?[indexPath.row] as? Dictionary<String,AnyObject>
        let name = model?["name"] as? String ?? ""
        let mobile = model?["mobile"] as? String ?? ""
//        cell?.textLabel?.text = "\(model["name"]!)---\(model["mobile"]!)"
        cell?.textLabel?.text = "\(name)---\(mobile)"
        return cell!
    }
}
