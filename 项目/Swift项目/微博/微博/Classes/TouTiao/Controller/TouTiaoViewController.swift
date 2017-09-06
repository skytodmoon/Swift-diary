//
//  TouTiaoViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/9/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SnapKit
import MJRefresh
import SVProgressHUD

class TouTiaoViewController: UIViewController {
    
    /// 微头条数据
    fileprivate var microNews = [TouTiao]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        /// 获取微头条数据
        let header = RefreshHeder(refreshingBlock: { [weak self] in
            NetworkTool.loadTouTiaoData { (weitoutiaos) in
                self!.tableView.mj_header.endRefreshing()
                self!.microNews = weitoutiaos
                self!.tableView.reloadData()
            }
        })
        header?.isAutomaticallyChangeAlpha = true
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView.mj_header = header
        tableView.mj_header.beginRefreshing()
        
        tableView.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: { [weak self] in
            // 加载更多
            NetworkTool.loadTouTiaoData { (weitoutiaos) in
                self!.tableView.mj_footer.endRefreshing()
                if weitoutiaos.count == 0 {
                    SVProgressHUD.setForegroundColor(UIColor.white)
                    SVProgressHUD.setBackgroundColor(UIColor(r: 0, g: 0, b: 0, alpha: 0.3))
                    SVProgressHUD.showInfo(withStatus: "没有更多内容啦~")
                    return
                }
                self!.microNews += weitoutiaos
                self!.tableView.reloadData()
            }
        })


        // Do any additional setup after loading the view.
    }

    fileprivate lazy var headerView: WeitoutiaoHeaderView = {
        let headerView = WeitoutiaoHeaderView.headerView()
//        headerView.delegate = self
        return headerView
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
        tableView.tableFooterView = UIView()
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.separatorStyle = .none
        //        tableView.register(UINib(nibName: String(describing: WeiTouTiaoCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WeiTouTiaoCell.self))
        return tableView
    }()
    
    /// 没有数据时显示
    fileprivate lazy var notNetworkView: NotNetworkView = {
        let notNetworkView = NotNetworkView.noNetworkView()
        return notNetworkView
    }()
    
    fileprivate lazy var bgView: UIView = {
        let bgView = UIView()
        return bgView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TouTiaoViewController {
    
    fileprivate func setupUI() {
        // 设置导航栏颜色
        navigationController?.navigationBar.theme_barTintColor = "colors.otherNavBarTintColor"
        view.backgroundColor = UIColor.globalBackgroundColor()
        navigationItem.rightBarButtonItem?.theme_tintColor = "colors.black"
        view.addSubview(bgView)
        bgView.addSubview(headerView)
        bgView.addSubview(tableView)
        
        bgView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(kNavBarHeight)
            make.bottom.equalTo(view).offset(-kTabBarHeight)
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(bgView)
            make.height.equalTo(kWeiTouTiaoHeaderHieght)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.left.bottom.right.equalTo(bgView)
        }
        
    }
}



