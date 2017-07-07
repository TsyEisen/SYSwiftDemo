//
//  SYHomeViewController.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/27.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class CRMHomeViewController: SYBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var monthBtn: UIButton!
    @IBOutlet weak var salepriceLabel: UILabel!
    
    let headerView = CRMHomeHeaderView.viewFromNib()
    let datePicker = CRMDatePicker(mode: .date)
    
    var topData:CRMHomeTopData? {
        didSet {
            salepriceLabel.text = String(describing: topData?.salesAvgPrice)
        }
    }
    var datas:Dictionary<String, Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.sy_registerNib(cellclass: CRMHomeMainCell.self)
        tableView.sy_registerNib(cellclass: CRMHomeTitleCell.self)
        tableView.tableFooterView = UIView()
        topView.backgroundColor = UIColor.appMainColor
        tableView.tableHeaderView = headerView
        
        CRMHomeTopData.sy_objectWithKeyValues(dict: ["12":"23"])
    }
    
    func requestData() {
        let requestTop = SYRequest.requestHomeTopData(date: "2017-06")
        SYNetworkTool.sharedTool.requestData(requestModel: requestTop) { (result, error) in
            print(result)
        }
        
        let requestBottom = SYRequest.requestHomeBottomData(date: "2017-06")
        SYNetworkTool.sharedTool.requestData(requestModel: requestBottom) { (result, error) in
            print(result)
        }
    }
    
    @IBAction func chooseMonths() {
        datePicker.show()
    }
    //MARK:-UITableView数据源
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CRMHomeTitleCell.sy_classNameString)
            return cell!
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CRMHomeMainCell.sy_classNameString)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 55 : 170
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}
