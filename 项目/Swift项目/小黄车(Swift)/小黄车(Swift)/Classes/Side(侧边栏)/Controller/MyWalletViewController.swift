//
//  MyWalletViewController.swift
//  小黄车(Swift)
//
//  Created by 金亮齐 on 2017/6/6.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//
import UIKit

class MyWalletViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的钱包"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 按钮点击
    @IBAction func balanceStatement(_ sender: UIButton) {
        self.showHint(hint: "余额说明")
    }
    
    @IBAction func rechargeBtnClick(_ sender: UIButton) {
        self.showHint(hint: "充值")
    }
}
