//
//  MainViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpMainView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
// MARK: - 初始化UI
extension MainViewController {
    
    fileprivate func setUpMainView() {
        setUpNavgationBar()
    }
    
    fileprivate func setUpNavgationBar() {
        
        // 1.设置左侧的Item
        
        let size = CGSize(width: 0, height: 0)
        let leftBarItem = UIBarButtonItem(imageName: "icon_home_Nav_left", highImageName: "", size: size, target: self, action: #selector(self.leftClick(_:)))
        navigationItem.leftBarButtonItems = [leftBarItem]
        
        // 2.设置右侧的Item
        let rightBarItem = UIBarButtonItem(imageName: "icon_home_Nav_right", highImageName: "", size: size, target: self, action: #selector(self.rightClick(_:)))
        navigationItem.rightBarButtonItems = [rightBarItem]
        
    }
    
    @objc fileprivate func leftClick(_ btn: UIButton) {
        print("点击了左侧")
    }
    
    // 搜索
    @objc fileprivate func rightClick(_ btn: UIButton) {
        print("点击了右侧")
    }
}
