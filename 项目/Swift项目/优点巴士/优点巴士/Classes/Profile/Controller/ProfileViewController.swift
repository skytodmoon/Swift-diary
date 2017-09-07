//
//  ProfileViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


import UIKit

private let kProfileCellID = "kProfileCellID"


// MARK: --  列表标题
private let kMeSubScribe   = "我的行程"
private let kMePlayHistory = "我的订单"
private let kMeHasBuy      = "所有线路"
private let kMeWallet      = "我的线路"
private let kMeStore       = "深圳通卡"
private let kMeStoreOrder  = "更多"



class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    /// 列表标题数组
    fileprivate lazy var titleArray:[[String]] = {
        return [[kMeSubScribe, kMePlayHistory,
                kMeHasBuy, kMeWallet,
                kMeStore, kMeStoreOrder]]
        }()
    /// 列表图标数组
    lazy var imageArray:[[String]] = {
        return [["mine_follow", "mine_money",
                "mine_fanbao", "mine_bag",
                "mine_money", "mine_money"]]
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
    
        automaticallyAdjustsScrollViewInsets = false
        tableview.rowHeight = 44.0
        tableview.isScrollEnabled = false
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: kProfileCellID)
        tableview.separatorStyle = UITableViewCellSeparatorStyle.none
        // Do any additional setup after loading the view.
    }



}

// MARK: --  UITableView的数据源和代理方法
extension ProfileViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let subTitle = titleArray[indexPath.section]
        let imageArr = imageArray[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kProfileCellID, for: indexPath)
        
        
        cell.textLabel?.text = subTitle[indexPath.row]
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.selectionStyle = .none
        cell.accessoryType = .none
        
        cell.imageView?.image = UIImage(named: imageArr[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        guard let title = cell?.textLabel?.text else {
            return
        }
        
        if title == kMeStore {
            jump2FreeTraficService()
        }else if title == kMeStoreOrder {
            jump2SettingVC()
        }
    }
    
}

// MARK:- 界面跳转
extension ProfileViewController {

    fileprivate func jump2FreeTraficService() {
        
        print("流量")
    }
    
    fileprivate func jump2SettingVC() {
        print("更多")
    }
    
}



