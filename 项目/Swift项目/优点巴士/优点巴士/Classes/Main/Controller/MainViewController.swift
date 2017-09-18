//
//  MainViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setRootController()
        // Do any additional setup after loading the view.
    }
    //MARK: - 设置根控制器
    func setRootController(){
        let rootController = HomeViewController()
        let leftViewController = LeftController()
        let drawerMenuController:DrawerMenuController = DrawerMenuController()
        drawerMenuController.rootViewController = rootController
        drawerMenuController.leftViewController = leftViewController
        drawerMenuController.needSwipeShowMenu = true
        
        UIApplication.shared.delegate?.window!?.rootViewController = drawerMenuController
    }
}
