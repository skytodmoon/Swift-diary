//
//  CityViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import ZHDropDownMenu

class CityViewController: UIViewController {
    
    fileprivate lazy var HeaderView : UIView = {[unowned self] in
        
        let headerview = ZHDropDownMenu()
        headerview.frame = CGRect(x: 0, y: 0, width: ScreenW, height: 44)
        //设置下拉列表项数据
        headerview.options = ["北京","深圳","上海","厦门","广州"]
        //设置最大高度
        headerview.menuHeight = 240;
        //设置默认值
        headerview.defaultValue = "深圳"
        headerview.buttonImage = UIImage(named:"icon_cityBus_head_down.png")

        return headerview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.view.addSubview(HeaderView)
        // Do any additional setup after loading the view.
    }



}
