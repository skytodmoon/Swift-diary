//
//  ClubTopicController.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let  ClubTopicCellID = "ClubTopicCell"
private let  ClubTopicHeaderCellID = "ClubTopicHeaderCell"

class ClubTopicController: UIViewController {
    
    var clubTopicModels = [[ClubTopicModel](),[ClubTopicModel]()]
    var clubTopicModel : ClubHotModel!
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    
        self.loadData()
        // Do any additional setup after loading the view.
    }

    func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.backgroundColor = UIColor.colorWith(245, green: 245, blue: 245, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: ClubTopicCellID, bundle: nil), forCellReuseIdentifier: ClubTopicCellID)
        tableView.registerNib(UINib(nibName: ClubTopicHeaderCellID, bundle: nil), forCellReuseIdentifier: ClubTopicHeaderCellID)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
        title = "话题详细"
        view.addSubview(tableView)

    }
    private func loadData(){
        
        let url = "http://www.duitang.com/napi/topic/comment/list/?topic_id=" + "\(clubTopicModel.id)"
        
        NetWorkTool.sharedInstance.get(url, parameters: nil, success: { (response) -> () in
            
            self.clubTopicModels = ClubTopicModel.loadClubTopicModels(response!)
            self.tableView.reloadData()
            
        }) { (error) -> () in
        }
    }
}

extension ClubTopicController: UITableViewDataSource,UITableViewDelegate {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return clubTopicModels.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubTopicModels[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ClubTopicCellID, forIndexPath: indexPath) as! ClubTopicCell
        cell.clubTopicModel = clubTopicModels[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        return tableView.fd_heightForCellWithIdentifier(ClubTopicCellID, cacheByIndexPath: indexPath, configuration: { (AnyObject) -> Void in
            
            (AnyObject as! ClubTopicCell).clubTopicModel = self.clubTopicModels[indexPath.section][indexPath.row]
        })
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TopicSectionHeader.loadFromXib()
        section == 0 ? (view.titleLabel.text = "热门评论") : (view.titleLabel.text = "所有评论")
        return view
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  25
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        DEBUGLOG(indexPath.row)
    }
}

