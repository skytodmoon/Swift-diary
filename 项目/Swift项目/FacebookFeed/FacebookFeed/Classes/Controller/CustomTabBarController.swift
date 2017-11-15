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
        navaigationController.title = "新闻"
        navaigationController.tabBarItem.image = UIImage(named: "tabBar_essence_click_icon")
        
        let friedRequestController = FriendRequestsController()
        let secondNavController = UINavigationController(rootViewController: friedRequestController)
        secondNavController.title = "中心"
        secondNavController.tabBarItem.image = UIImage(named: "tabBar_friendTrends_click_icon")
        
        viewControllers = [navaigationController,secondNavController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
