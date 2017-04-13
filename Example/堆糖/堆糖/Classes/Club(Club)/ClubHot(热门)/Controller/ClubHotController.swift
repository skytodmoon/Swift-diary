//
//  ClubHotController.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let ClubHotCellID = "ClubHotCell"

class ClubHotController: UIViewController {
    
    private var tableView: UITableView!
    private var models = [ClubHotModel]()
    private var pageCount = 0

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
        tableView!.registerNib(UINib(nibName: ClubHotCellID, bundle: nil), forCellReuseIdentifier: ClubHotCellID)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.contentInset.top = 5
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        tableView.mj_header = RefreshHeader.init(refreshingBlock: { () -> Void in
            
            self.loadNewData()
        })
        tableView!.mj_header.beginRefreshing()
        tableView!.mj_footer = RefreshFooter.init(refreshingBlock: { () -> Void in
            self.loadMoreData()
        })
    }
    
    private func loadNewData() {
        let urlParams = [
            "start":"0",
            "tags":"精选",
            ]
        NetWorkTool.sharedInstance.get("http://www.duitang.com/napi/topic/list/by_tags/", parameters: urlParams, success: { (response) -> () in
            

            
            print("请求成功")
            self.tableView.reloadData()
            self.tableView!.mj_header.endRefreshing()
            
        }) { (error) -> () in
            
            DEBUGLOG(error)
            self.tableView!.mj_header.endRefreshing()
        }
    }
    
    private func loadMoreData() {
        let urlParams = [
            "start":"0",
            "tags":"精选",
            ]
        NetWorkTool.sharedInstance.get("http://www.duitang.com/napi/topic/list/by_tags/", parameters: urlParams, success: { (response) -> () in
            
            print("请求成功")
            self.tableView.reloadData()
            
            self.tableView!.mj_footer.endRefreshing()
            
        }) { (error) -> () in
            
            
        self.tableView!.mj_footer.endRefreshing()    }
    }
    
}

extension ClubHotController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ClubHotCellID, forIndexPath: indexPath) as! ClubHotCell
//        cell.clubHotModel = models[indexPath.row]
        return cell

    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let clubHotModel = models[indexPath.row]
////        return clubHotModel.modelHeight
//    }
//
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        let model = models[indexPath.row]
//        let vc = ClubTopicController()
//        vc.clubTopicModel = model
//        navigationController?.pushViewController(vc, animated: true)
    }

}

