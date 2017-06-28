//
//  ViewController.swift
//  SwiftPractice
//
//  Created by leju_esf on 17/4/7.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Person(name: "好的").greet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

