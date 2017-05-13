//
//  QJLNavigationController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class QJLNavigationController: UINavigationController {
    
    override class func initialize(){
        
        UINavigationBar.appearance().setBackgroundImage(UIImage.init(named: "navigationbarBackgroundWhite"), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(20)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        /* 点击返回导航栏的时候隐藏tabbar*/
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = setBackBarButtonItem()
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func setBackBarButtonItem() -> UIBarButtonItem{
        
        let button = UIButton.init(type: .Custom)
        button.setImage(UIImage.init(named: "navigationButtonReturn"), forState: .Normal)
        button.setImage(UIImage.init(named: "navigationButtonReturnClick"), forState: .Highlighted)
        button.setTitle("返回", forState: .Normal)
        button.setTitleColor(UIColor(red: 81/255, green: 81/255, blue: 81/255, alpha: 1), forState: .Normal)
        button.addTarget(self, action: #selector(QJLNavigationController.back), forControlEvents: .TouchUpInside)
        button.frame.size = CGSize(width: 60 , height: 30)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        return UIBarButtonItem.init(customView: button)
    }
    
    func back() {
        
        self.popViewControllerAnimated(true)
    }

}
