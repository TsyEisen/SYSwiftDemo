//
//  SYNetworkTool.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/28.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class SYNetworkTool: NSObject {
    static let sharedTool = SYNetworkTool()
    private let baseUrl = "https://wkcrm.99114.cn"
    private override init() {}
    
    func requestData(requestModel:SYRequest,completion:@escaping (_ result:[String: AnyObject],_ error:Error?)->Void){
        request("\(baseUrl)\(requestModel.url)" , method:.get, parameters:requestModel.params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if(response.result.isSuccess){
                if let value = response.result.value as? [String: AnyObject] {
                    guard value["code"] as! String == "0000" else {
                        print(value["message"] ?? "系统错误")
                        return
                    }
                    completion(value["respBody"] as! [String : AnyObject], nil)
                }else {
                    print("服务器故障")
                }
            }
            
        }
    }
}
