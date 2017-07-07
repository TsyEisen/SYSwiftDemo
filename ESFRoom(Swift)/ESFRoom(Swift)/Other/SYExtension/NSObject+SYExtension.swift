//
//  NSObject+SYExtension.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/29.
//  Copyright © 2017年 tsy. All rights reserved.
//

import Foundation

extension NSObject {
    class var sy_classNameString : String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

private let set = NSSet(array: [
    NSURL.classForCoder(),
    NSDate.classForCoder(),
    NSValue.classForCoder(),
    NSData.classForCoder(),
    NSError.classForCoder(),
    NSArray.classForCoder(),
    NSDictionary.classForCoder(),
    NSString.classForCoder(),
    NSAttributedString.classForCoder()
    ])

extension NSObject{
    
    
    
    //dict: 要进行转换的字典
    class func sy_objectWithKeyValues(dict: NSDictionary){
//        if set.contains(self.classForCoder()) {
//            print("只有自定义模型类才可以字典转模型")
//            assert(true)
//            return nil
//        }
        
        let c = self.classForCoder()
        var count : UInt32 = 0
        let ivars = class_copyIvarList(c, &count)
        for i in 0..<count {
            let iva = ivars![Int(i)]
            let name = String.init(cString: ivar_getName(iva)!)
            let type = String.init(cString: property_getName(iva))
            print("类型----",type,"属性名---",name)
        }
        
        var count2 : UInt32 = 0
        
        let properties  = class_copyPropertyList(CRMHomeTopData.self, &count2)
        print("数组",properties)
        for i in 0..<count2 {
            let property = properties![Int(i)]
            let propertyType = String.init(cString: property_getAttributes(property)!)
            let propertyKey = String.init(cString: property_getName(property))
             print("类型2----",propertyType,"属性名2---",propertyKey)
            
        }
        
//        while "NSObject" != "\(c)" {
//
//
//            }
//        }
    }
}


//class SYFoundation {

    
//    static let  bundlePath = Bundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
//
//    /*** 判断某个类是否是 Foundation中自带的类 */
//    class func isClassFromFoundation(c:AnyClass)->Bool {
//        var  result = false
//        if c == NSObject.classForCoder(){
//            result = true
//        }else{
//            set.enumerateObjects({ (foundation,  stop) -> Void in
//                if  c.isSubclass(foundation as! AnyClass) {
//                    result = true
//                    stop.initialize(to: true)
//                }
//            })
//        }
//        return result
//    }
//
    /** 很据属性信息， 获得自定义类的 类名*/
    /**
     let propertyType = String.fromCString(property_getAttributes(property))! 获取属性类型
     到这个属性的类型是自定义的类时， 会得到下面的格式： T+@+"+..+工程的名字+数字+类名+"+,+其他,
     而我们想要的只是类名，所以要修改这个字符串
     */
//    class func getType(code:String)->String?{
//
//        if !code.containsString(bundlePath){ //不是自定义类
//            return nil
//        }
//        code = code.componentsSeparatedByString("\"")[1]
//        if let range = code.rangeOfString(bundlePath){
//            code = code.substringFromIndex(range.endIndex)
//            var numStr = "" //类名前面的数字
//            for c:Character in code.characters{
//                if c <= "9" && c >= "0"{
//                    numStr+=String(c)
//                }
//            }
//            if let numRange = code.rangeOfString(numStr){
//                code = code.substringFromIndex(numRange.endIndex)
//            }
//            return bundlePath+"."+code
//        }
//        return nil
//    }
//}

