//
//  TopicController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON

class TopicController: UITableViewController {
    
    /**  数据源  */
    var topics:[Topic] = []
    /**  话题id  */
    var type = 0
    /**  当前页  */
    var page = 1
    /**  请求下一页需要的参数  */
    var maxtime = ""
    /**  请求地址需要的的字典  */
    var params = NSMutableDictionary()
    
    var header:MJRefreshNormalHeader{
        return (self.tableView.tableHeaderView as? MJRefreshNormalHeader)!
    }

    var footer:MJRefreshFooter{
        return (self.tableView.tableFooterView as? MJRefreshFooter)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        /*  设置tableview */
        setUpTableView()
        /* 设置刷新控件 */
        setUpRefrshControl()
    }
    
    // 设置tableview
    func setUpTableView() {
        
        tableView.contentInset = UIEdgeInsets(top: 45, left: 0, bottom: 48, right: 0)
        /*  滚动条的偏移值 */
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 64, left: 0, bottom: 48, right: 0)
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.registerNib(UINib.init(nibName: "TopicCell", bundle: nil), forCellReuseIdentifier: "TopicCell")
    }
    
    // 设值刷新控件
    func setUpRefrshControl() {
        
        
        tableView.tableHeaderView = MJRefreshNormalHeader.init(refreshingBlock: { () -> Void in
            // 结束上啦刷新
            self.footer.endRefreshing()
            
            var params = [String:AnyObject]()
            params["a"] = self.parentViewController!.isKindOfClass(NewestController) ? "newlist" : "list"
            params["c"] = "data";
            params["type"] = self.type
            
            self.params.setDictionary(params);
            
            // 发送请求
            CreamTool.getTopics(params, successfulBlock: { (obj) -> () in
                // 返回的结果 不是最新一次的结果 不处理
                if (!self.params.isEqualToDictionary(params)){
                    return
                }
                
                self.topics = obj[0] as! [Topic]
                self.tableView.tableFooterView?.hidden = false
                self.maxtime = obj[1] as! String
                self.tableView.reloadData()
                self.header.endRefreshing()
                
                self.page = 0
            })
        })
        header.automaticallyChangeAlpha = true
        header.beginRefreshing()
        
        tableView.tableFooterView = MJRefreshAutoNormalFooter.init(refreshingBlock: { () -> Void in
            // 结束下拉刷新
            self.header.endRefreshing()
            var params = [String:AnyObject]()
            params["a"] = self.parentViewController!.isKindOfClass(NewestController) ? "newlist" : "list"
            params["c"] = "data"
            params["type"] = self.type
            let page = self.page + 1
            params["page"] = page
            params["maxtime"] = self.maxtime;
            self.params.setDictionary(params)
            // 发送请求
            CreamTool.getTopics(params, successfulBlock: { (obj) -> () in
                // 返回的结果 不是最新一次的结果 不处理
                if (!self.params.isEqualToDictionary(params)){
                    return
                }
                self.topics += obj[0] as! [Topic]
                self.maxtime = obj[1] as! String
                self.tableView.reloadData()
                self.footer.endRefreshing()
                self.page = page
            })
        })
        tableView.tableFooterView?.hidden = true
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return topics.count ?? 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TopicCell") as! TopicCell
        cell.topic = self.topics[indexPath.row]
        return cell
    }
    
    // MARK: - tableView  delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let commentController = CommentController()
        commentController.topic = self.topics[indexPath.row]
        navigationController?.pushViewController(commentController, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return topics[indexPath.row].cellHeight
    }


}
