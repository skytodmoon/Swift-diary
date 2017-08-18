//
//  TabBarController.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarAppear = UITabBarItem.appearance()
        tabBarAppear.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: UIControlState.selected)
        
        setUpAllChildViewControllers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - setUpAllChildViewControllers
    fileprivate func setUpAllChildViewControllers() {
        let normalImages = ["btn_home_normal","btn_live_normal","btn_column_normal","btn_user_normal"]
        let selectedImages = ["btn_home_selected","btn_live_selected","btn_column_selected","btn_user_selected"]
        let HomeVC = HomeViewController()
        setUpNavRootViewControllers(vc: HomeVC, title: "首页", imageName: normalImages[0], selectImage: selectedImages[0])
        let LiveVC = LiveViewController()
        setUpNavRootViewControllers(vc: LiveVC, title: "直播", imageName: normalImages[1], selectImage: selectedImages[1])
        
        let garageVC = DiscoverViewController()
        setUpNavRootViewControllers(vc: garageVC, title: "发现", imageName: normalImages[2], selectImage: selectedImages[2])
        
        let profileVC = ProfileViewController()
        setUpNavRootViewControllers(vc: profileVC, title: "我的", imageName: normalImages[3], selectImage: selectedImages[3])
    }
    fileprivate func setUpNavRootViewControllers(vc: UIViewController,title:String,imageName: String, selectImage: String){
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: selectImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.addChildViewController(NavController(rootViewController: vc))
    }
}
