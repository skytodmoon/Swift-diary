//
//  SettingViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
        
        createTableView()
    }
    
    func setNav() {
        navigationItem.title = "设置"
        view.backgroundColor = QJLBgColor
    }

    func createTableView() {
        
        let settingTableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Grouped)
        self.view.addSubview(settingTableView)
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init()
        cell.selectionStyle = .None
        
        if (indexPath.section == 0) {
            cell.textLabel?.text = "清除缓存"
        }else if (indexPath.section == 1){
            cell.textLabel?.text = "我的github"
        }
        return cell
    }
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("点击了");
    }
    

    

}
