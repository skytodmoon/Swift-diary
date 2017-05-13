//
//  QJLTabBarController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class QJLTabBarController: UITabBarController {
    
    override class func initialize(){
        
    /*设置tabbarItem的字体选中的颜色*/
    var attr = [String:AnyObject]()
    attr[NSForegroundColorAttributeName] = UIColor(red: 81/255, green: 81/255, blue: 81/255, alpha: 1)
    UITabBarItem.appearance().setTitleTextAttributes(attr, forState: .Selected)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*添加所有子控制器*/
        addChildViewControllers()
        /*设置tabbar*/
        setTabBar()
    }
    
    func addChildViewControllers() {
        
        setChildrenController("精华", image: UIImage.init(named:"tabBar_essence_icon")!, selectedImage: UIImage.init(named: "tabBar_essence_click_icon")!, controller: CreamController.init())
        
        setChildrenController("最新", image: UIImage.init(named: "tabBar_new_icon")!, selectedImage: UIImage.init(named: "tabBar_new_click_icon")!,controller: NewestController.init())
        
        setChildrenController("关注", image: UIImage.init(named: "tabBar_friendTrends_icon")!, selectedImage: UIImage.init(named: "tabBar_friendTrends_click_icon")!,controller: AttentionController.init())
        
        setChildrenController("我", image: UIImage.init(named: "tabBar_me_icon")!, selectedImage: UIImage.init(named: "tabBar_me_click_icon")!,controller: MeController.init(style:.Grouped))
    }
    
 
    func setTabBar() {
        
        let newTabBar = QJLTabBar.init(frame: tabBar.bounds)
        
        setValue(newTabBar, forKey: "tabBar")
    }
    
    private func setChildrenController(title:String,image:UIImage,selectedImage:UIImage,controller:UIViewController) {
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = image
        controller.tabBarItem.selectedImage = selectedImage
    
        let nav = QJLNavigationController.init(rootViewController: controller)
        addChildViewController(nav)
    }
}
