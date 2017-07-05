//
//  SYTabBarController.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/6/27.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

class SYTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        tabBar.tintColor = UIColor.appMainColor()
        tabBar.barTintColor = UIColor.white
        tabBar.backgroundColor = UIColor.white
        
        addBtn.addTarget(self, action:#selector(addNewMessage), for: .touchUpInside)
        tabBar.addSubview(addBtn)
        
        setUpViewControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in 0..<tabBar.items!.count {
            let item = tabBar.items![i]
            if i == 2 {
                item.isEnabled = false
                break
            }
        }
    }
    
    @objc private func addNewMessage() {
        print("发布")
    }
    
    private lazy var addBtn:UIButton = {
        
       let btn = UIButton(frame:CGRect(x:(ScreenW - 49)*0.5, y: 5.5, width: 49, height: 38))
        btn.setBackgroundImage(UIImage(named:"add"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named:"add_hover"), for: UIControlState.highlighted)
        return btn
        
    }()
}

extension SYTabBarController {
    private func setUpViewControllers() {
        let array = NSArray(contentsOfFile: Bundle.main.path(forResource: "controllerInfor", ofType: ".plist")!)!
        for info in array {
            
            let vcInfor = info as! Dictionary<String, String>
            let controller = vcInfor["controller"]
            let title = vcInfor["title"]
            let image = vcInfor["image"]
            
            addchildviewController(controller: controller, title: title, image: image)
        }
    }
    
    private func addchildviewController(controller:String?,title:String?,image:String?) {
        
        var childVC = SYBaseViewController()
        
        if title == "首页" {
            childVC = CRMHomeViewController(nibName: controller, bundle: nil)
        }
        
        if title == "工作台" {
            childVC = CRMWorkBenchViewController(nibName: controller, bundle: nil)
        }
        
        if title == "消息" {
            childVC = CRMMessageViewController(nibName: controller, bundle: nil)
        }
        
        if title == "我的" {
            childVC = CRMMineViewController(nibName: controller, bundle: nil)
        }
        
        if title!.count > 0 {
            childVC.title = title
            childVC.tabBarItem.image = UIImage(named: image!)
            childVC.tabBarItem.selectedImage = UIImage(named: image! + "_hover")
        }else {
            childVC.tabBarItem.isEnabled = false
        }
        
        let nav = SYNavigationController(rootViewController: childVC)
        
        addChildViewController(nav)
    }
    
}
