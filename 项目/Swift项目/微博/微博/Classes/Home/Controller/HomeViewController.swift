//
//  HomeViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - 判断用户是否登录
        if !userIsLogin {
        visitorView.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", message: "我是醉看红尘这场梦,这是我仿写的新浪微博客户端")
        }
        setupNav()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - 设置导航的左右按钮和中间的按钮
    private func setupNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_friendattention", target: self, action: #selector(HomeViewController.leftItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_pop", target: self, action: #selector(HomeViewController.rightItemClick))
        //点击中间按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("醉看红尘这场梦", forState: .Normal)
        titleBtn .addTarget(self, action: #selector(HomeViewController.titltBtnClick(_:)), forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    @objc private func leftItemClick (){
        
    }
    @objc private func rightItemClick () {
        
    }
    func titltBtnClick(btn:TitleButton){
        let popoverVC = PopoverViewController()
      
        
        presentViewController(popoverVC, animated: true, completion: nil)
    }
}
