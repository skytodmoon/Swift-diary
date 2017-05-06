//
//  MainViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - 添加Tabbar下的四大控制器
    private func addChildViewController () {
        
        addChildViewController(HomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(UIViewController())
        addChildViewController(MessageViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(MessageViewController(), title: "我的", imageName: "tabbar_profile")
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
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let width = UIScreen.mainScreen().bounds.size.width / CGFloat(viewControllers!.count)
        let rect = CGRect(x: 0, y: 0, width: width, height: 49)
        composeButton.frame = CGRectOffset(rect, width * 2, 0)
    }
    //MARK: - 懒加载中间的按钮
    private var composeButton: UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        button.addTarget(self, action: #selector(MainViewController.composeBtnClick), forControlEvents: .TouchUpInside)
        button.addTarget(self, action: #selector(MainViewController.composeBtnClick), forControlEvents: .TouchUpInside)
        self.tabBar.addSubview(button)
        return button
    }
    @objc private func composeBtnClick(){
        let composeVC = ComposeViewController()
        let nav = UINavigationController(rootViewController: composeVC)
        presentViewController(nav, animated: true, completion: nil)
    }
}
