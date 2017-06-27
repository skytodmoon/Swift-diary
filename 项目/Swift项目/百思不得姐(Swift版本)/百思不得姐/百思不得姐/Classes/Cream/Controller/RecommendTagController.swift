//
//  RecommendTagController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class RecommendTagController: UITableViewController {
    
    /**  标签数组  */
    var tags:[RecommendTag] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        /**  初始化tableView  */
        setUpTableview()
        
        /* 获取数据内容 */
        getTags()
    }
    
    /** 初始化tableView */
    func setUpTableview() {
        self.title = "推荐标签";
        self.tableView.tableFooterView = UIView.init()
        self.tableView.registerNib(UINib.init(nibName: "RecommendTagCell", bundle: nil), forCellReuseIdentifier: "RecommendTagCell")
        self.tableView.rowHeight = 70;
        self.tableView.backgroundColor = QJLBgColor;
        
    }
    
    /** 获取数据内容 */
    func getTags() {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultMaskType(.Black)
        CreamTool.getCategory { (obj) -> () in
            self.tags = obj as! [RecommendTag]
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tags.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RecommendTagCell") as!RecommendTagCell
        cell.recommendTag = tags[indexPath.row]
        
        return cell
    }

    }
