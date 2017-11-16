//
//  CustomTabBarController.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navaigationController = UINavigationController(rootViewController: feedController)
        navaigationController.title = "News Feed"
        navaigationController.tabBarItem.image = UIImage(named: "tabBar_essence_click_icon")
        
        let friedRequestController = FriendRequestsController()
        let secondNavController = UINavigationController(rootViewController: friedRequestController)
        secondNavController.title = "Request"
        secondNavController.tabBarItem.image = UIImage(named: "tabBar_friendTrends_click_icon")
        
        
        let messengerVC = UIViewController()
        messengerVC.navigationItem.title = "SOME TITLE"
        let messengerNavController = UINavigationController(rootViewController: messengerVC)
        messengerNavController.title = "Message"
        messengerNavController.tabBarItem.image = UIImage(named: "tabBar_me_click_icon")
        
        let notificationsNavController = UINavigationController(rootViewController: UIViewController())
        notificationsNavController.title = "Notifications"
        notificationsNavController.tabBarItem.image = UIImage(named: "tabBar_new_click_icon")
        
        viewControllers = [navaigationController,secondNavController,messengerNavController,notificationsNavController]
        
        tabBar.translucent = false
        let topBoder = CALayer()
        topBoder.frame = CGRectMake(0, 0, 1000, 0.5)
        topBoder.backgroundColor = UIColor.rgb(229, green: 231, blue: 235).CGColor
        
        tabBar.layer.addSublayer(topBoder)
        tabBar.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
