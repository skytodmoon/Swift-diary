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
        let urlParams = [
            "app_code":"gandalf",
            "app_version":"5.9 rv:150681",
            "device_name":"Unknown iPhone",
            "device_platform":"iPhone6,1",
            "locale":"zh_CN",
            "platform_name":"iPhone OS",
            "platform_version":"9.2.1",
            "screen_height":"568",
            "screen_width":"320",
            ]
        NetWorkTool.sharedInstance.get("http://www.duitang.com/napi/index/groups/", parameters: urlParams, success: { (response) -> () in
            
            self.models = ExploreMainModel.loadExploreMainModels(response!)
            self.tableView.reloadData()
            
        }) { (error) -> () in
            
            DEBUGLOG(error)
            
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

