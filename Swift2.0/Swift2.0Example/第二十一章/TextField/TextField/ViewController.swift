//
//  ViewController.swift
//  TextField
//
//  Created by 金亮齐 on 2017/4/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: --遵从UITextFieldDelegate委托协议方法
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        NSLog("call textFieldShouldBeginEditing:")
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        NSLog("call textFieldDidBeginEditing:")
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        NSLog("call textFieldShouldEndEditing:")
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        NSLog("call textFieldDidEndEditing:")
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        NSLog("call textFieldShouldReturn:")
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //注册键盘出现通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardDidShow(_:)), name: UIKeyboardDidShowNotification, object: nil)
        //注册键盘隐藏通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardDidHide(_:)), name: UIKeyboardDidHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //注销键盘出现通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidShowNotification, object: nil)
        //注销键盘隐藏通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        NSLog("键盘打开")
    }
    
    func keyboardDidHide(notification: NSNotification) {
        NSLog("键盘关闭")
    }

}

