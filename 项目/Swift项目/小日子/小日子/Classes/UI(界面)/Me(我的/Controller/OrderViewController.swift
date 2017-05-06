//
//  OrderViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    init() {
        super.init(nibName: "OrderViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: "OrderViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的订单"
        view.backgroundColor = theme.SDBackgroundColor
        
    }

}
