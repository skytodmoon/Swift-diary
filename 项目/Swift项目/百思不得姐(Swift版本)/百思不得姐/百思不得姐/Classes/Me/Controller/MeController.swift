//
//  MeController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
        
        setTableView()
    }
    
    func setNav() {
        navigationItem.title = "我的"
        view.backgroundColor = QJLBgColor
        
        navigationItem.leftBarButtonItems = [Common.itemWithImage(UIImage.init(named: "nav_coin_icon")!, highlightImage: UIImage.init(named: "nav_coin_icon_click")!, target: self, action: #selector(MeController.coinButtonClick)),]
            
        navigationItem.rightBarButtonItems = [Common.itemWithImage(UIImage.init(named:"mine-setting-icon")!,highlightImage:UIImage.init(named: "mine-setting-icon-click")!, target: self, action: #selector(MeController.setting)),
                                              Common.itemWithImage(UIImage.init(named:"mine-moon-icon")!,highlightImage:UIImage.init(named: "mine-moon-icon-click")!, target: self, action: #selector(MeController.tagView))]
        
    }
    
    func coinButtonClick(){
        
    }
    
    
    func setting() {
        
        let secondViewController = SettingViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
    func tagView() {
        
    }
    
    func setTableView() {
        
        self.tableView.separatorStyle = .None
        self.tableView.sectionHeaderHeight = 0
        self.tableView.sectionHeaderHeight = margin
        self.tableView.contentInset = UIEdgeInsetsMake(-15, 0, 0, 0)
        self.tableView.tableFooterView = MeFooterView.init(frame: CGRectZero, settingHeightAction: { () -> () in
        })
        
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init()
        cell.selectionStyle = .None
        
        if (indexPath.section == 0) {
            cell.imageView?.image = UIImage.init(named: "setup-head-default")
            cell.textLabel?.text = "登录/注册"
        }else if (indexPath.section == 1){
            cell.textLabel?.text = "离线下载"
        }
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("点击了");
        
        if (indexPath.section==0) {
            
            let loginVC = LoginController()
            presentViewController(loginVC, animated: true, completion: nil)

        }else if (indexPath.section==1){
            NSLog("点击了离线下载");
        }
    }
    
    
}
