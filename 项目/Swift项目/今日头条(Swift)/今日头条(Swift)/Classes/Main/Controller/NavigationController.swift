//
//  NavigationController.swift
//  今日头条(Swift)
//
//  Created by 金亮齐 on 2017/5/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override class func initialize() {
        super.initialize()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.whiteColor()
        navBar.tintColor = Color(0, g: 0, b: 0, a: 0.7)
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_28x28_"), style: .Plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    func navigationBack() {
        popViewControllerAnimated(true)
    }

}
