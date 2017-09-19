//
//  TransitViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


private let transitCellID = "transitCellID"

private let transitHeaderCellID = "transitHeaderCellID"

class TransitViewController: UIViewController {
    
    // MARK: 懒加载属性
    fileprivate lazy var transitVM : TransitModelView = TransitModelView()
    
    fileprivate lazy var transitHeaderVM : TransitModelHeaderView = TransitModelHeaderView()
    
    fileprivate lazy var headerView : UITableView = {[unowned self] in
        let rect = CGRect(x: 0, y: 0, width: ScreenW, height: 160)
        let headerView = UITableView(frame: rect)
        headerView.dataSource = self
        headerView.delegate = self
        headerView.separatorStyle = UITableViewCellSeparatorStyle.none
        headerView.register(UINib(nibName: "TransitViewCellHeaderCell", bundle: nil), forCellReuseIdentifier: transitHeaderCellID)
        return headerView
        }()
    
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        let rect = CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH-64-40)
        let tableView = UITableView(frame: rect)
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = self.headerView
        tableView.addSubview(self.headerView)
        tableView.register(UINib(nibName: "TransitViewCell", bundle: nil), forCellReuseIdentifier: transitCellID)
        return tableView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        view.addSubview(headerView)
        loadData()
        loadHeaderData()
        // Do any additional setup after loading the view.
    }

    

}

// MARK:- 请求数据
extension TransitViewController {
    
    func loadData() {
        transitVM.loadtransitData{
            self.tableView.reloadData()
        }
        
    }
    func loadHeaderData() {
        transitHeaderVM.loadHeaderData(){
            self.headerView.reloadData()
        }
    }
}

// MARK:- 遵守UITableView的数据源&代理
extension TransitViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView.isEqual(self.headerView){
            return transitHeaderVM.transitHeaderModel.count
        }else {
            return transitVM.transitModel.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView ==  headerView) {
            let cell = tableView.dequeueReusableCell(withIdentifier: transitHeaderCellID, for: indexPath) as! TransitViewCellHeaderCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.transitHeadermodel = transitHeaderVM.transitHeaderModel[indexPath.item]
            return cell
            
           
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: transitCellID, for: indexPath) as! TransitViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.transitmodel = transitVM.transitModel[indexPath.item]
            return cell
        }
        

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (tableView  == headerView) {
            return 80
        }else{
            return 60
        }
    }
    
}
