//
//  MeViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/10.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class MeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigation()
        setUpTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpNavigation() {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "mine-setting-icon"), for: .normal)
        button.setBackgroundImage(UIImage(named: "mine-setting-icon-click"), for: .highlighted)
        button.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func setUpTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "meCell")
        tableView.sectionHeaderHeight = cellTextMargin
        tableView.sectionFooterHeight = 0
        tableView.contentInset = UIEdgeInsets(top: cellTextMargin - 35, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = MeFooterView()
    }
}

extension MeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "meCell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "meCell")
        }
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = "登录注册"
        } else {
            cell?.textLabel?.text = "离线下载"
        }
        
        return cell!
        
    }
}

