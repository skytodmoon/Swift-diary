//
//  MainNavController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavAppearance ()
        // Do any additional setup after loading the view.
    }

//    // MARK: - 拦截Push操作
//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        // 这里判断是否进入push视图
//        if (self.childViewControllers.count > 0) {
//            let backBtn = UIButton(image: #imageLiteral(resourceName: "icon_left"), highlightedImage: #imageLiteral(resourceName: "icon_left"), title: "返回",target: self, action: #selector(MainNavController.backClick))
//            
//            // 设置按钮内容左对齐
//            backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
//            // 内边距
//            backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//            
//            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
//            // 隐藏要push的控制器的tabbar
//            viewController.hidesBottomBarWhenPushed = true
//        }
//        super.pushViewController(viewController, animated: animated)
//    }
//    
//    @objc fileprivate func backClick() {
//        popViewController(animated: true)
//    }


}
//MARK: - 设置导航栏的颜色
extension MainNavController  {
    
    fileprivate func setUpNavAppearance () {
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0)
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.boldSystemFont(ofSize: 18)]
    }
}
