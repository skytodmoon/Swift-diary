//
//  OfflineDownloadController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class OfflineDownloadController: UITableViewController {
    
    var titles = [TopicTitle]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

extension OfflineDownloadController {
    fileprivate func setupUI() {
        navigationItem.title = "离线下载"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下载", style: .plain, target: self, action: #selector(downloadBarButtonItem))
    }
}

extension OfflineDownloadController {
    @objc fileprivate func downloadBarButtonItem() {
        
    }
}
