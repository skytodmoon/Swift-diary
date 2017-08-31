//
//  ProfileViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

class ProfileViewController: BaseTableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - 判断用户是否登录
        if !userIsLogin{
            visitorView.setupVisitorInfo(isHome: false, imageName: "visitordiscover_image_profile", message: "我是醉看红尘这场梦,这是我仿写的新浪微博客户端")
        }else{
            setNav()
            
            setTableView()
        }
    

        // Do any additional setup after loading the view.
    }

    func setNav() {
        navigationItem.title = "我的"
        view.backgroundColor = QJLBgColor
    }
    
    func setTableView() {
        
        /**
        // DGElasticPullToRefresh用法
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            print("请求数据")
            self?.tableView.dg_stopLoading()
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        */
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 44), style: UITableViewStyle.grouped)
        self.tableView.separatorStyle = .none
        self.tableView.sectionHeaderHeight = margin
        self.tableView.contentInset = UIEdgeInsetsMake(-10, 0, 0, 0)
        self.tableView.tableFooterView = MeFooterView.init(frame: CGRect.zero, settingHeightAction: { () -> () in
        })
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init()
        cell.selectionStyle = .none
        
        if (indexPath.section == 0) {
            cell.textLabel?.text = "醉看红尘这场梦"
        }else if (indexPath.section == 1){
            cell.textLabel?.text = "离线下载"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section==0) {
            
            let nav = UINavigationController(rootViewController: OAuthViewController())
            present(nav, animated: true, completion: nil)
            
        }else if (indexPath.section==1){
            NSLog("点击了离线下载");
        }
    }
}
