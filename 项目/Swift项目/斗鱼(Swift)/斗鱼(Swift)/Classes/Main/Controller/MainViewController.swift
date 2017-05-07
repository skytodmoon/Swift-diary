//
//  MainViewController.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - 点击时候文字的颜色
        let tabBarAppear = UITabBarItem.appearance()
        tabBarAppear.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: UIControlState.selected)

        setUpAllChildViewControllers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 设置控制器
    fileprivate func setUpAllChildViewControllers () {
        let normalImages = ["btn_home_normal","btn_live_normal","btn_column_normal","btn_user_normal"]
        let selectedImages = ["btn_home_selected","btn_live_selected","btn_column_selected","btn_user_selected"]
        
        let newsVC = HomeViewController()
        setUpNavRootViewCOntrollers(vc: newsVC, title: "首页", imageName: normalImages[0], selImage: selectedImages[0])
        
        let circleVC = LiveViewController()
        setUpNavRootViewCOntrollers(vc: circleVC, title: "直播", imageName: normalImages[1], selImage: selectedImages[1])
        
        let garageVC = UIViewController()
        setUpNavRootViewCOntrollers(vc: garageVC, title: "关注", imageName: normalImages[2], selImage: selectedImages[2])
        
        let profileVC = ProfileViewController()
        setUpNavRootViewCOntrollers(vc: profileVC, title: "我的", imageName: normalImages[3], selImage: selectedImages[3])
    }
    
    
    fileprivate func setUpNavRootViewCOntrollers(vc: UIViewController, title:String, imageName: String, selImage: String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: selImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.addChildViewController(MainNavController(rootViewController: vc))
    }
}
