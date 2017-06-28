//
//  Greetable.swift
//  SwiftPractice
//
//  Created by leju_esf on 17/4/7.
//  Copyright © 2017年 tsy. All rights reserved.
//

import Foundation

protocol Greetable {
    var name: String{get}
    func greet()
}

struct Person:Greetable {
    let name : String
    func greet() {
        print("你好\(name)");
    }
}
