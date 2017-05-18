//
//  FirstIntroduceController.swift
//  今日头条(Swift)
//
//  Created by 金亮齐 on 2017/5/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class FirstIntroduceController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mobileButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func wechatButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func QQButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func weiboButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func enterButtonClick(sender: UIButton) {
        UIApplication.sharedApplication().keyWindow?.rootViewController = TabBarController()
    }
}
