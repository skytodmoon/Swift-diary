//
//  MainTabBarController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildViewController()

        // Do any additional setup after loading the view.
    }

    /**
     * 初始化所有的子控制器
     */
    private func setupChildViewController() {
        
        // 探店
        tabBaraAddChildViewController(vc: ExploreViewController(), title: "探店", imageName: "recommendation_1", selectedImageName: "recommendation_2")
        // 体验
        tabBaraAddChildViewController(vc: ExperienceViewController(), title: "体验", imageName: "broadwood_1", selectedImageName: "broadwood_2")
        // 分类
        tabBaraAddChildViewController(vc: ClassifyViewController(), title: "分类", imageName: "classification_1", selectedImageName: "classification_2")
        // 我的
        tabBaraAddChildViewController(vc: MeViewController(), title: "我的", imageName: "my_1", selectedImageName: "my_2")
        
    }
    private func tabBaraAddChildViewController(vc vc: UIViewController, title: String, imageName: String, selectedImageName: String){
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vc.view.backgroundColor = theme.SDBackgroundColor
        let nav = NavigationController(rootViewController: vc)
        addChildViewController(nav)
    }
}

class MainTabbar: UITabBar  {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundImage = UIImage(named: "tabbar")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}