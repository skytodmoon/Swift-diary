//
//  SubbankViewController.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class SubbankViewController: UIViewController {
    
    var typeName : String = ""
    var currentIndex : Int = 0 {
        didSet {
            switch currentIndex {
            case 0:
                typeName = "rankStar" // 明星榜
            case 1:
                typeName = "rankWealth" // 富豪榜
            case 2:
                typeName = "rankPopularity" // 人气榜
            case 3:
                typeName = "rankAll" // 周星榜
            default:
                print("错误类型")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
