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
        
        RequestData()
        // Do any additional setup after loading the view.
    }
    
    fileprivate lazy var pageView: HomePageView = {
        let pageView = HomePageView()
        pageView.backgroundColor = UIColor.orange
        return pageView
    }()
    
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

extension HomeViewController {
    
    fileprivate func RequestData(){
        
        /// 获取标题数据
        NetworkTool.loadHomeTitlesData(fromViewController: String(describing: HomeViewController.self)) { (topTitles, homeTopicVCs) in
            // 将所有子控制器添加到父控制器中
            for childVc in homeTopicVCs {
                self.addChildViewController(childVc)
            }
            self.setupUI()
            
//            self.pageView.titles = topTitles
//            self.pageView.childVcs = self.childViewControllers as? [TopicViewController]
        }
    }
}

extension HomeViewController {
    
    fileprivate func setupUI(){
        
        view.addSubview(pageView)
        
        pageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view).offset(kNavBarHeight)
        }
//
//        NotificationCenter.default.addObserver(self, selector: #selector(homeTitleAddButtonClicked(notification:)), name: NSNotification.Name(rawValue: "homeTitleAddButtonClicked"), object: nil)
//
//        /// 点击了加号按钮
//        func homeTitleAddButtonClicked(notification: Notification) {
//            print("点击了加号")
//        }
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
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
