//
//  BaseTableViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController,VisitorViewDelegate {
    
    var userIsLogin = UserAccount.userLogin()
    
    var visitorView = VisitorView()
    
    override func loadView() {
        
        userIsLogin ? super.loadView() : setupVisitorView()
        
    }
    
    //MARK: - 设置用户没有登录的时候加载旋转动画
    private func setupVisitorView() {
        visitorView.delegate = self
        view = visitorView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(BaseTableViewController.registerBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: #selector(BaseTableViewController.loginBtnDidClick))
        
    }
    
    func loginBtnDidClick(){
        let nav = UINavigationController(rootViewController: OAuthViewController())
        presentViewController(nav, animated: true, completion: nil)
    }
    
    func registerBtnClick(){
        print(#function)
    }
}
