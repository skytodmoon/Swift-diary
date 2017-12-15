//
//  MainTabbarController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/11.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        
        setupController()
        // Do any additional setup after loading the view.
    }

    func setupController(){
        /// 首页
        let onePageVC = HomeViewController(titles: ["推荐",
                                                     "VIP",
                                                     "订阅",
                                                     "排行"],
                                            vcs: [BoutiqueListViewController(),
                                                  VIPListViewController(),
                                                  SubscibeListViewController(),
                                                  RankListViewController()],
                                            pageStyle: .navgationBarSegment)
        addChildViewController(onePageVC,
                               title: "首页",
                               image: UIImage(named: "tab_home"),
                               selectedImage: UIImage(named: "tab_home_S"))
        
        /// 分类
        let classVC = CateListViewController()
        addChildViewController(classVC, title: "分类", image: UIImage(named: "tab_class"), selectedImage: UIImage(named: "tab_class_S"))
        
        /// 书架
        let bookVC = BookViewController(titles: ["收藏",
                                                  "书单",
                                                  "下载"],
                                         vcs: [CollectListViewController(),
                                               DocumentListViewController(),
                                               DownloadListViewController()],
                                         pageStyle: .navgationBarSegment)
        addChildViewController(bookVC,
                               title: "书架",
                               image: UIImage(named: "tab_book"),
                               selectedImage: UIImage(named: "tab_book_S"))
        
        /// 我的
        let mineVC = MineViewController()
        addChildViewController(mineVC, title: "我的", image: UIImage(named: "tab_mine"), selectedImage: UIImage(named: "tab_mine_S"))
    }
    
    func addChildViewController(_ childController: UIViewController, title: String?,image:UIImage?,selectedImage:UIImage?) {
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil,image:image?.withRenderingMode(.alwaysOriginal),selectedImage:selectedImage?.withRenderingMode(.alwaysOriginal))
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        }
        addChildViewController(MainNavigationController(rootViewController:childController))
    }

}

extension UITabBarController{
    override open var preferredStatusBarStyle: UIStatusBarStyle{
        guard let select = selectedViewController else {return .lightContent}
        return select.preferredStatusBarStyle
    }
}
