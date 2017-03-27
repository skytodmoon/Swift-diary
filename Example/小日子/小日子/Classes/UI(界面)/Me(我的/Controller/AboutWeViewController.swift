//
//  AboutWeViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/22.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class AboutWeViewController: UIViewController {

    
    init() {
        super.init(nibName: "AboutWeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: "AboutWeViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "关于我们"
    }

}
