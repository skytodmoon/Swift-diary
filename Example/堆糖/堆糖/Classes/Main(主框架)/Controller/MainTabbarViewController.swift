//
//  MainTabbarViewController.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        addAllController()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func addAllController() {
        
        addOneVc(HomeMainController(), title: "首页", image: "tab_icon_home")
        addOneVc(ExploreMainController(), title: "发现", image: "tab_icon_explore")
        addOneVc(StoreController(), title: "商店", image: "tab_icon_store")
        addOneVc(ClubMainController(), title: "开源", image: "tab_icon_club")
        addOneVc(MeMainController(), title: "我", image: "tab_icon_me")
        
        
        tabBar.tintColor = UIColor.tintColor()
        
    }
    
    private func addOneVc(childVC:UIViewController, title:String, image:String)  {
        
        childVC.title = title
        
        childVC.tabBarItem.image = UIImage(named: image)
        
        childVC.tabBarItem.selectedImage = UIImage(named: image + "_highlight" )
        
        let nav = MainNavigationController()
        
        nav.addChildViewController(childVC)
        
        addChildViewController(nav)
    }

}
