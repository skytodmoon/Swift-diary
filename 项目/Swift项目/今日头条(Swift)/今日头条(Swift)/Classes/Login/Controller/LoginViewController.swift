//
//  LoginViewController.swift
//  今日头条(Swift)
//
//  Created by 金亮齐 on 2017/5/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.borderColor = Color(246, g: 68, b: 65, a: 1.0).CGColor
        registerButton.layer.borderWidth = klineWidth
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func registerButtonClick(sender: UIButton) {
        
    }
}
