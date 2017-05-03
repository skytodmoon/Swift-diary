//
//  NavgationViewController.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class NavgationViewController: UINavigationController {

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            // push的时候, 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            // 添加返回按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .Done, target: self, action: #selector(NavgationViewController.back))
        }
        super.pushViewController(viewController, animated: true)
        
    }
    
    func back() {
        popViewControllerAnimated(true)
    }

}
