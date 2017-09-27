//
//  MainTabBarController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabbarColor()
        addChildViewControllers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    ///MARK: - 设置Tabbar字体颜色
    private func setTabbarColor(){
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
    }
    
    ///MARK: - 添加子控制器
    private func addChildViewControllers() {
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectedImage: "home_tabbar_press_32x32_")
        addChildViewController(childController: VideoViewController(), title: "视频", imageName: "video_tabbar_32x32_", selectedImage: "video_tabbar_press_32x32_")
        addChildViewController(childController: WeiTouTiaoViewController(), title: "微头条", imageName: "weitoutiao_tabbar_32x32_", selectedImage: "weitoutiao_tabbar_press_32x32_")
        addChildViewController(childController: MineViewController(), title: "未登录", imageName: "no_login_tabbar_32x32_", selectedImage: "no_login_tabbar_press_32x32_")
    }
    
    private func addChildViewController(childController: UIViewController, title: String, imageName: String, selectedImage: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImage)
        childController.title = title
        let navC = MainNavigationController(rootViewController: childController)
        addChildViewController(navC)
    }

}
