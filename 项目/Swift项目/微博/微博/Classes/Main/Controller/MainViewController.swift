//
//  MainViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewController()
        // Do any additional setup after loading the view.
    }
    
    private func addChildViewController () {
        
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(childController: MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(UIViewController())
        addChildViewController(childController: DiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(childController: ProfileViewController(), title: "我的", imageName: "tabbar_profile")
    }
    
    //MARK: - 设置TaBbar的图片颜色，以及点击高亮
    private func addChildViewController(childController: UIViewController, title : String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        childController.title = title
        let nav = UINavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
    
    //MARK: - 计算中间按钮的frame
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let width = UIScreen.main.bounds.size.width / CGFloat(viewControllers!.count)
        let rect = CGRect(x: 0, y: 0, width: width, height: 49)
        composeButton.frame  = rect.offsetBy(dx: width * 2, dy: 0)
    }
    //MARK: - 懒加载中间的按钮
    private var composeButton: UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState.normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        button.addTarget(self, action: #selector(MainViewController.composeBtnClick), for: .touchUpInside)
        self.tabBar.addSubview(button)
        return button
    }
    
    @objc private func composeBtnClick(){
        UIApplication.shared.keyWindow?.rootViewController?.present(PublishController(), animated: false, completion: nil)
    }
}
