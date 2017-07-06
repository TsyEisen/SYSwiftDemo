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
        
        let urlString = baseUrl + requestModel.url
        request(urlString, method:requestModel.type, parameters:requestModel.params, encoding: URLEncoding.default, headers:["Content-Type": "application/json;charset=UTF-8"]).responseJSON { (response) in
                if(response.result.isSuccess){
                    let value = response.result.value as? [String: AnyObject]
                    guard (value?.keys.contains("code"))! else {
                        print("没有code错误",value?["message"] ?? "系统错误")
                        return
                    }
                    guard value?["code"] as! String == "200" else {
                        print("code不为200",value?["message"] ?? "系统错误")
                        return
                    }
                    guard (value?.keys.contains("respBody"))! else {
                        print("没有respBody",value?["message"] ?? "系统错误")
                        return
                    }
                    completion(value!["respBody"] as! [String : AnyObject], nil)
                }else {
                    print("服务器故障")
                }
            }
        }
}
