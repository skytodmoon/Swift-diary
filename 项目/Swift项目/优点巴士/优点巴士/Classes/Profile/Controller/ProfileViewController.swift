//
//  ProfileViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


import UIKit
private let kEdgeMargin : CGFloat = 26
private let kMiddleMargin : CGFloat = 22
private let kTopMargin : CGFloat = 33.5

class ProfileViewController: UIViewController {
    
    fileprivate var targetRight : CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    init(kTargetRight : CGFloat) {
        super.init(nibName: nil, bundle: nil)
        self.targetRight = kTargetRight
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
