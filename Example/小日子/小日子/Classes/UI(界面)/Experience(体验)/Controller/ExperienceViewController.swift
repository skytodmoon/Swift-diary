//
//  ExperienceViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ExperienceViewController: MainViewController {
    
    var experModel: ExperienceModel? {
        didSet {
            headView?.experModel = experModel
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
