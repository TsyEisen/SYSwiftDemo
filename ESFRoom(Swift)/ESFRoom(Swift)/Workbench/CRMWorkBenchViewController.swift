//
//  CRMWorkBenchViewController.swift
//  ESFRoom(Swift)
//
//  Created by 唐绍禹 on 2017/7/1.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class CRMWorkBenchViewController: SYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(addBtn)
        //btn.addTarget(self, action: #selector(self.changeStringBtn(_:)), for: .touchUpInside)
        
//        addBtn.addTarget(self, action: #selector("addNewMessage"), for: .touchUpInside)
        addBtn.addTarget(self, action: Selector("addNewMessage"), for: .touchUpInside)
    }
    
    private func addNewMessage() {
        print("发布")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var addBtn:UIButton = {
        
        let btn = UIButton(frame:CGRect(x:(ScreenW - 49)*0.5, y: 60, width: 49, height: 38))
        
        btn.setBackgroundImage(UIImage(named:"add"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named:"add_hover"), for: UIControlState.highlighted)
        
        return btn
    }()

}
