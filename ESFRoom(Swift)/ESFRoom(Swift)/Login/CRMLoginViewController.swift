//
//  CRMLoginViewController.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/7/6.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit
import Foundation

class CRMLoginViewController: SYBaseViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var contentViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.inputAccessoryView = pickerViewToolbar
        passwordTextField.inputAccessoryView = pickerViewToolbar
        contentViewHeight.constant = ScreenH + 1
        contentViewWidth.constant = ScreenW
        
    }
    
    @IBAction func loginAction() {
        SYAccountManager.manager.login(account: userTextField.text!, password: passwordTextField.text!) { (status) in
            if status {
                 self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc private func doneBtnClick() {
        print("完成")
        view.endEditing(true)
    }
    
    @objc private func cancelBtnClick() {
        print("取消")
        view.endEditing(true)
    }
    
    lazy var pickerViewToolbar : UIToolbar = {
        let toolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: ScreenW, height: 44))
        toolbar.barStyle = UIBarStyle.default
        toolbar.backgroundColor = UIColor.white
        
        let cancelBtn = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelBtnClick))
        cancelBtn.tintColor = UIColor.black
        
        let flexi = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneBtn = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(doneBtnClick))
        doneBtn.tintColor = UIColor.appMainColor
        
        toolbar.setItems([cancelBtn,flexi,doneBtn], animated: false)
        return toolbar
    }()
}
