//
//  ClubClubController.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let ClubClubCellID = "ClubClubCell"

class ClubClubController: UIViewController {
    
    var models = [ClubClubModel]()
    
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
        // Do any additional setup after loading the view.
    }

    func setupTableview() {
    
        tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.backgroundColor = UIColor.colorWith(245, green: 245, blue: 245, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView!.registerNib(UINib(nibName: ClubClubCellID, bundle: nil), forCellReuseIdentifier: ClubClubCellID)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.contentInset.top = 5
        tableView!.tableFooterView = UIView()
        tableView!.rowHeight = 50
        tableView!.contentInset.top = 29
        tableView!.sectionHeaderHeight = 0
        tableView!.sectionFooterHeight = 10
        view.addSubview(tableView)
        self.loadNewData()
    }
    
    private func loadNewData() {
        
        let urlParams = [
            "app_code":"gandalf",
            "app_version":"5.8 rv:149591",
            "device_name":"Unknown iPhone",
            "device_platform":"iPhone6,1",
            "include_fields":"check_in",
            "limit":"0",
            "locale":"zh_CN",
            "platform_name":"iPhone OS",
            "platform_version":"9.2.1",
            "screen_height":"568",
            "screen_width":"320",
            "start":"0",
            "user_id":"11189659",
            ]

        NetWorkTool.sharedInstance.get("http://www.duitang.com/napi/club/list/by_user_id/", parameters: urlParams, success: { (response) -> () in
            self.models = ClubClubModel.loadClubClubModels(response!)
            self.tableView.reloadData()
        }) { (error) -> () in
        }
    }

}
// MARK: - TableviewDataSource
extension ClubClubController: UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? models.count : 1
        
    }
    
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            let vc = ClubMoreController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ClubClubCellID, forIndexPath: indexPath) as! ClubClubCell
        if indexPath.section == 0 {
            cell.clubClubModel = models[indexPath.row]
            cell.nameLabel.textColor = UIColor.blackColor()
        }else {
            cell.photoImageView.image = UIImage(named: "more_club")
            cell.nameLabel.text = "浏览更多Club"
            cell.nameLabel.textColor = UIColor.grayColor()
            cell.unreadLabel.text = ">"
            
        }
        return cell
    }
}

