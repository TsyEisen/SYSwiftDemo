//
//  SYRequest.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/28.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class SYRequest: NSObject {
    var url:String = ""
    var params:Dictionary<String, Any>?
    var type:HTTPMethod = HTTPMethod.get
    
    convenience init(url:String,params:Dictionary<String, Any>?,type:HTTPMethod = HTTPMethod.get) {
        self.init()
        self.url = url
        self.params = params
        self.type = type
    }
    
    class func requestLogin(account:String,password:String) -> SYRequest {
        let request = SYRequest()
        request.url = "/user/toLogin"
        request.params = ["account":account,"passwd":password]
        request.type = HTTPMethod.post
        return request
    }
    
    class func requestHomeTopData(date:String) -> SYRequest {
        let request = SYRequest()
        request.url = "/crm/mainInfo/myAchievement"
        request.params = ["month":date]
        return request
    }
    
    class func requestHomeBottomData(date:String) -> SYRequest {
        let request = SYRequest()
        request.url = "/crm/mainInfo/rankList"
        request.params = ["month":date]
        return request
    }
}
