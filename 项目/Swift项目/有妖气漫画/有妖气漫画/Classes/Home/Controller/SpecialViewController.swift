//
//  SpecialViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/20.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class SpecialViewController: BaseViewController {
    
    private var page: Int = 1
    private var argCon: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    convenience init(argCon: Int = 0) {
        self.init()
        self.argCon = argCon
    }
}
