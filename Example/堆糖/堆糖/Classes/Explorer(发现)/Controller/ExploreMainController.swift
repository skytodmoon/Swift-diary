//
//  ExploreMainController.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire


private let ExploreMainCellID = "ExploreMainCell"
private let urlString = "http://www.duitang.com/napi/index/groups/?app_code=gandalf&app_version=5.9%20rv%3A150681&device_name=Unknown%20iPhone&device_platform=iPhone6%2C1&locale=zh_CN&platform_name=iPhone%20OS&platform_version=9.2.1&screen_height=568&screen_width=320"

class ExploreMainController: UIViewController {
    
    private var tableView: UITableView!
    
    var models = [ExploreMainModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTableview() {
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.backgroundColor = UIColor.colorWith(245, green: 245, blue: 245, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: ExploreMainCellID, bundle: nil), forCellReuseIdentifier: ExploreMainCellID)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.contentInset.top = 5
        view.addSubview(tableView)
        sendRequestRequest()
    }
    
    
    private func sendRequestRequest() {

//        NetWorkTool.sharedInstance.get(urlString, parameters: nil, success: { (response) -> () in
//            
//            self.models = ExploreMainModel.loadExploreMainModels(response!)
//            self.tableView.reloadData()
//            
//        }) { (error) -> () in
//            
//            DEBUGLOG(error)
//            
//        }
        NetWorkTool.getData(urlString, parameters: nil, failBlock: { (obj) in
            print("请求失败")
            }) { (obj) in
                self.models = ExploreMainModel.loadExploreMainModels(obj!)
                self.tableView.reloadData()
        }
        
    }
}

extension ExploreMainController: UITableViewDataSource,UITableViewDelegate {
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ExploreMainCellID) as! ExploreMainCell
        cell.exploreMainModel = models[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 0 ? 180 : 120
    }
}
extension ExploreMainController: ExploreMainCellDetegate {
    func exploreCollectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}

