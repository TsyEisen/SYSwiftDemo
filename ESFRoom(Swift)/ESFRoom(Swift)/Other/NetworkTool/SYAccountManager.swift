//
//  SYAccountManager.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/7/6.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class SYAccountManager: NSObject {
    static let manager = SYAccountManager()
    private(set) var user : CRMUserModel = CRMUserModel()
    func login(account:String,password:String,completion:@escaping(_ status:Bool)->Void) {
        let request = SYRequest.requestLogin(account: account, password: password)
        SYNetworkTool.sharedTool.requestData(requestModel: request) { (result, error) in
            print(result)
        }
    }
}
