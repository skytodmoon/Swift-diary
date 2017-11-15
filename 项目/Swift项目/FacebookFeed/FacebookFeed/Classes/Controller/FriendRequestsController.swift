//
//  FriendRequestsController.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class FriendRequestsController: UITableViewController {
    
    
    static let cellId = "cellId"
    static let headerId = "headerId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "中心"
        
        tableView.separatorColor = UIColor.rgb(229, green: 231, blue: 235)
        tableView.sectionHeaderHeight = 26
        tableView.registerClass(FriednRequestCell.self, forCellReuseIdentifier: FriendRequestsController.cellId)
        tableView.registerClass(RequestHeader.self,forHeaderFooterViewReuseIdentifier: FriendRequestsController.headerId)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(FriendRequestsController.cellId, forIndexPath: indexPath) as! FriednRequestCell
        if indexPath.row % 3 == 0 {
            cell.nameLabel.text = "章紫玲"
            cell.requestImageView.image = UIImage(named: "headImage1")
        }else if indexPath.row % 3 == 1{
            cell.nameLabel.text = "醉看红尘这场梦"
            cell.requestImageView.image = UIImage(named: "headImage")
        }else {
            cell.nameLabel.text = "章紫玲"
            cell.requestImageView.image = UIImage(named: "headImage1")
        }
        
        cell.imageView?.backgroundColor = UIColor.blackColor()
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(FriendRequestsController.headerId) as! RequestHeader
        
        if section == 0 {
            header.nameLabel.text = "FRIEND REQUEST"
        }else {
            header.nameLabel.text = "PROPLE YOU MAY KNOE"
        }
        return header
    }

}
