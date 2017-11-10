//
//  MainViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/3.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBarUI()
        setUpControllerUI()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTabBarUI() {
        let tabbar = UITabBarItem.appearance()
        
        let attrs_Normal = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.gray]
        let attrs_Select = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        
        tabbar.setTitleTextAttributes(attrs_Normal, for: .normal)
        tabbar.setTitleTextAttributes(attrs_Select, for: .selected)
    }
    
    func setUpControllerUI() {
        
        let vc1 = EssenceViewController()
        vc1.tabBarItem.title = "精华"
        vc1.tabBarItem.image = UIImage(named: "tabBar_essence_icon")
        vc1.tabBarItem.selectedImage = UIImage(named: "tabBar_essence_click_icon")
        
        
        let vc2 = NewViewController()
        vc2.tabBarItem.title = "新帖"
        vc2.tabBarItem.image = UIImage(named: "tabBar_new_icon")
        vc2.tabBarItem.selectedImage = UIImage(named: "tabBar_new_click_icon")
        
        
        let vc = UIStoryboard(name: "FriendStoryboard", bundle: nil).instantiateViewController(withIdentifier: "FriendVC")
        let vc3 = vc
        vc3.tabBarItem.title = "关注"
        vc3.tabBarItem.image = UIImage(named: "tabBar_friendTrends_icon")
        vc3.tabBarItem.selectedImage = UIImage(named: "tabBar_friendTrends_click_icon")
        
        let vc4 = MeViewController(style: .grouped)
        vc4.tabBarItem.title = "我"
        vc4.tabBarItem.image = UIImage(named: "tabBar_me_icon")
        vc4.tabBarItem.selectedImage = UIImage(named: "tabBar_me_click_icon")
        
        let vcs = [vc1, vc2, vc3, vc4]
        for vc in vcs {
            let red = CGFloat(arc4random_uniform(UInt32(255)))
            let green = CGFloat(arc4random_uniform(UInt32(255)))
            let blue = CGFloat(arc4random_uniform(UInt32(255)))
            
            if #available(iOS 10.0, *) {
                vc.view.backgroundColor = UIColor(displayP3Red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
            } else {
                // Fallback on earlier versions
            }
            let nav = MainNavigationController(rootViewController: vc)
            nav.navigationBar.setBackgroundImage(UIImage(named:"navigationbarBackgroundWhite"), for: .default)
            addChildViewController(nav)
        }
        
        setValue(TabBar(), forKey: "tabBar")
    }
    
}
