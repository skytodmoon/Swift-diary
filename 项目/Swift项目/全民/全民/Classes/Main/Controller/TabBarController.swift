//
//  TabBarController.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()
        
        let tabBarAppear = UITabBarItem.appearance()
        tabBarAppear.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor(r: 252, g: 84, b: 88)], for: UIControlState.selected)
        // Do any additional setup after loading the view.
    }

    /// 添加所有子控制器
    func addChildViewControllers() {
        
        setupOneChildViewController("首页", image: "btn_tabbar_home_normal_25x25_", selectedImage: "btn_tabbar_home_selected_25x25_", controller: HomeViewController.init())
        setupOneChildViewController("栏目", image: "btn_tabbar_lanmu_normal_25x25_", selectedImage: "btn_tabbar_lanmu_selected_25x25_", controller: ColumnViewController.init())
        setupOneChildViewController("直播", image: "btn_tabbar_zhibo_normal_25x25_", selectedImage: "btn_tabbar_zhibo_selected_25x25_", controller: LiveListViewController.init())
        setupOneChildViewController("我的", image: "btn_tabbar_wode_normal_25x25_", selectedImage: "btn_tabbar_wode_selected_25x25_", controller: ProfileViewController.init())

    }
    
    /// 添加一个子控制器
    private func setupOneChildViewController(_ title: String, image: String, selectedImage: String, controller: UIViewController) {
        
        controller.tabBarItem.title = title
        controller.title = title
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let naviController = NavigationController.init(rootViewController: controller)
        addChildViewController(naviController)
    }

}
