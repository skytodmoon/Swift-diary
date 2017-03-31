//
//  TabBarController.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置tabBar图标颜色
        tabBar.tintColor = NAVIGATIONBAR_RED_COLOR
        
        // 添加所有子控制器
        addAllChildViewController()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /** 添加所有子控制器 */
    private func addAllChildViewController() {
        // 新闻
        let newsVc = UIStoryboard.init(name: "NewsViewController", bundle: nil).instantiateInitialViewController()!
        addChildViewController(newsVc, title: "资讯", imageName: "tabbar_icon_news")
        
        // 图秀
        let recVc = UIStoryboard.init(name: "PhotoViewController", bundle: nil).instantiateInitialViewController()!
        addChildViewController(recVc, title: "图秀", imageName: "tabbar_icon_media")
        
//        // 视频
//        let bzoneVc = UIStoryboard.init(name: "VideoViewController", bundle: nil).instantiateInitialViewController()!
//                addChildViewController(bzoneVc, title: "视频", imageName: "tabbar_icon_bar")
//        
//        //  阅读
//        let readVc = UIStoryboard.init(name: "ReadViewController", bundle: nil).instantiateInitialViewController()!
//                addChildViewController(readVc, title: "阅读", imageName: "tabbar_icon_reader")
//        
//        // 我
//        let profileVc = UIStoryboard.init(name: "ProfileViewController", bundle: nil).instantiateInitialViewController()!
//        addChildViewController(profileVc, title: "我", imageName: "tabbar_icon_me")
    }
    
    /**
     配置添加子控制器
     
     - parameter childController: 控制器
     - parameter title:           标题
     - parameter imageName:       图片
     */
    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        childController.title = title
        childController.tabBarItem.title = title
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        childController.tabBarItem.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFontOfSize(12)], forState: UIControlState.Normal)
        childController.tabBarItem.image = UIImage(named: "\(imageName)_normal")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: "\(imageName)_highlight")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        addChildViewController(childController)
    }

}
