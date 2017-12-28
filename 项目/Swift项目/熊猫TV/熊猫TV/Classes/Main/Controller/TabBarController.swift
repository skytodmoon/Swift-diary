//
//  TabBarController.swift
//  熊猫TV
//
//  Created by 金亮齐 on 2017/12/27.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        addChildViewControllers()
    }
    
    // MARK: - private method
    /// 添加所有子控制器
    func addChildViewControllers() {
        let HomeVC = HomeViewController()
        addChildViewController(HomeVC, title: "首页", image: UIImage(named: "menu_homepage_nor"), selectedImage: UIImage(named: "menu_homepage_sel"))
        
        let GameVC = GameViewController()
        addChildViewController(GameVC, title: "游戏", image: UIImage(named: "menu_youxi_nor"), selectedImage: UIImage(named: "menu_youxi_sel"))
        
        let EntertainmentVC = EntertainmentViewController()
        addChildViewController(EntertainmentVC, title: "娱乐", image: UIImage(named: "menu_yule_nor"), selectedImage: UIImage(named: "menu_yule_sel"))
        
        let SmallShowVC = SmallShowViewController()
        addChildViewController(SmallShowVC, title: "小葱秀", image: UIImage(named: "menu_goddess_nor"), selectedImage: UIImage(named: "menu_goddess_sel"))
        
    }
    
    /// 添加一个子控制器
    func addChildViewController(_ childController: UIViewController, title: String?,image:UIImage?,selectedImage:UIImage?) {
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,image:image?.withRenderingMode(.alwaysOriginal),selectedImage:selectedImage?.withRenderingMode(.alwaysOriginal))
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
        addChildViewController(NavigationController(rootViewController:childController))
    }
}

extension UITabBarController{
    override open var preferredStatusBarStyle: UIStatusBarStyle{
        guard let select = selectedViewController else {return .lightContent}
        return select.preferredStatusBarStyle
    }
}


