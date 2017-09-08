//
//  ProfileViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

private let kProfileCellID = "kProfileCellID"
// MARK: --  列表标题
private let kMeTrip = "我的行程"
private let kMeOder = "我的订单"
private let kMeAllLine = "所有线路"
private let kMeLine    = "我的线路"
private let kMeShenZhen   = "深圳通卡"
private let kMeMore  = "更多"



class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var Profile: UIImageView!
    
    
    /// 列表标题数组
    fileprivate lazy var titleArray:[[String]] = {
        return [[kMeTrip, kMeOder,
                kMeAllLine, kMeLine,
                kMeShenZhen, kMeMore]]
        }()
    /// 列表图标数组
    lazy var imageArray:[[String]] = {
        return [["icon_of", "icon_Account-1",
                "icon_yh", "icon_circuit",
                "icon_SZTCard", "icon_byNeed"]]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
        tableview.rowHeight = 44.0
        tableview.isScrollEnabled = false
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: kProfileCellID)
        tableview.separatorStyle = UITableViewCellSeparatorStyle.none
        loadProfileDate()
        // Do any additional setup after loading the view.
    }

}

extension ProfileViewController {
    func loadProfileDate() {
        Alamofire.request("http://www.youdianbus.cn/ydbus-api/api/events/menu?token=a43acba1c90752f93e51f64364b71d9c&user_id=7c19f276d626928a611e0f58eeaddc09", method: .get, parameters: nil).responseJSON { (response) in
            
            if let value = response.result.value {
                let dict = JSON(value)
                    let dataDict = dict["data"].dictionary
                        if let eventDict = dataDict?["event"]?.dictionary{
                            print(eventDict)
                            let imgUrl = eventDict["imgUrl"]?.stringValue
                                guard let iconURL = URL(string: imgUrl!) else { return }
                                self.Profile.kf.setImage(with: iconURL)
                }
            }
        }
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
        cell.textLabel?.textColor = UIColor.darkText
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
        if title == kMeTrip {
            jump2MeTripVC()
        }else if title == kMeOder {
            jump2kMeOder()
        }else if title == kMeAllLine {
            jump2kMeAllLine()
        }else if title == kMeLine {
            jump2kMeLine()
        }else if title == kMeShenZhen {
            jump2kMeShenZhen()
        }else if title == kMeMore {
            jump2kMeMore()
        }
    }
    
}

// MARK:- 界面跳转
extension ProfileViewController {
    
    fileprivate func jump2MeTripVC(){
        print("我的行程")
    }
    fileprivate func jump2kMeOder(){
        print("我的订单")
    }
    fileprivate func jump2kMeAllLine(){
        print("所有线路")
    }
    fileprivate func jump2kMeLine(){
        print("我的线路")
    }
    
    fileprivate func jump2kMeShenZhen() {
        
        print("深圳通卡")
    }
    
    fileprivate func jump2kMeMore() {
        print("更多")
        let moreVC = MoreViewController()
        self.present(moreVC, animated: true)
    }
    
}



