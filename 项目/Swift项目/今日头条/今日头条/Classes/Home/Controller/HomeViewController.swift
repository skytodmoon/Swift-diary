//
//  HomeViewController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 设置导航栏颜色
        navigationController?.navigationBar.theme_barTintColor = "colors.homeNavBarTintColor"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.globalBackgroundColor()
        // 设置状态栏属性
        navigationController?.navigationBar.barStyle = .black
        // 自定义导航栏
        navigationItem.titleView = homeNavigationBar
        
        automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
    }
    
    // 自定义导航栏
    fileprivate lazy var homeNavigationBar: HomeNavigationBar = {
        let homeNavigationBar = HomeNavigationBar()
        homeNavigationBar.searchBar.delegate = self
        return homeNavigationBar
    }()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    /// UITextFieldDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        navigationController?.pushViewController(HomeSearchViewController(), animated: false)
        return true
    }
}
