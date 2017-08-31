//
//  ProfileViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


class ProfileViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()


            setNav()
            
            setTableView()
    

        // Do any additional setup after loading the view.
    }

    func setNav() {
        self.navigationItem.title = "消息内容"
        view.backgroundColor = UIColor(r: 0, g: 0, b: 0, alpha: 0.7)
    }
    
    func setTableView() {
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: UITableViewStyle.plain)
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tableView.tableFooterView = MeFooterView.init(frame: CGRect.zero, settingHeightAction: { () -> () in
        })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init()
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section==0) {
            

            
        }else if (indexPath.section==1){
            
        }
    }
}
