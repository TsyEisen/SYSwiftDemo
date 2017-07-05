//
//  CRMDatePicker.swift
//  ESFRoom(Swift)
//
//  Created by leju_esf on 2017/7/5.
//  Copyright © 2017年 tsy. All rights reserved.
//

import UIKit

protocol CRMDatePickerDelegate {
    func didFinishPickerDate(date:String)
}

class CRMDatePicker: NSObject {
    
    let datePicker = UIDatePicker()
    
    init(mode:UIDatePickerMode) {
        super.init()
        datePicker.datePickerMode = mode
        datePicker.locale = Locale(identifier: "zh-Hans")
    }
    
    func show() {
        UIApplication.shared.keyWindow?.addSubview(shadow)
        UIApplication.shared.keyWindow?.addSubview(textField)
        textField.becomeFirstResponder()
    }
    
    func dismiss() {
        textField.resignFirstResponder()
        textField.removeFromSuperview()
        shadow.removeFromSuperview()
    }
    
    @objc private func doneBtnClick() {
        print("完成")
        dismiss()
    }
    
     @objc private func cancelBtnClick() {
        print("取消")
        dismiss()
    }
    
    lazy var textField : UITextField = {
        let textField = UITextField()
        textField.inputView = self.datePicker
        textField.inputAccessoryView = self.pickerViewToolbar
        return textField
    }()
    
    lazy var pickerViewToolbar : UIToolbar = {
        let toolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: ScreenW, height: 44))
        toolbar.barStyle = UIBarStyle.default
        toolbar.backgroundColor = UIColor.white
        
        let cancelBtn = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelBtnClick))
        cancelBtn.tintColor = UIColor.black
        
        let flexi = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneBtn = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(doneBtnClick))
        doneBtn.tintColor = UIColor.appMainColor()
        
        toolbar.setItems([cancelBtn,flexi,doneBtn], animated: false)
        return toolbar
    }()
    
    lazy var shadow : UIView = {
        let shadow = UIView(frame:UIScreen.main.bounds)
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancelBtnClick))
        shadow.addGestureRecognizer(tap)
        shadow.backgroundColor = UIColor.black
        shadow.alpha = 0.6
        return shadow
    }()
}
