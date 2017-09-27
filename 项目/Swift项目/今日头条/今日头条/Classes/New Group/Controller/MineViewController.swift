//
//  MineViewController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {
    
    fileprivate var sections = [AnyObject]()
    fileprivate var concerns = [MyConcern]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestDate()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 头部视图
    fileprivate lazy var noLoginHeaderView: NoLoginHeaderView = {
        let noLoginHeaderView = NoLoginHeaderView.headerView()
        return noLoginHeaderView
    }()

}



extension MineViewController {
    
    fileprivate func setupUI() {
        
        /// 设置 tableView 属性
        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
        tableView.tableHeaderView = noLoginHeaderView
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsetsMake(-26, 0, 0, 0);
        tableView.register(UINib(nibName: String(describing: MineFirstSectionCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MineFirstSectionCell.self))
        tableView.register(UINib(nibName: String(describing: MineOtherCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MineOtherCell.self))
        
    }
    
}

extension MineViewController {
    fileprivate func requestDate(){
        NetworkTool.loadMineCellData { (sectionArray) in
            
            
        }
        
    }
    
}
