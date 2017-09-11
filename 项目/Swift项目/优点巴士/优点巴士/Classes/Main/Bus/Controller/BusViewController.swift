//
//  BusViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

private let BusCellID = "BusCellID"

class BusViewController: UIViewController {
    
    // MARK: 懒加载属性
    fileprivate lazy var BusVM : BusModelView = BusModelView()
    
    fileprivate lazy var tableView : UITableView = {[unowned self] in
    let rect = CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH-64-40)
    let tableView = UITableView(frame: rect)
    tableView.backgroundColor = UIColor.groupTableViewBackground
    tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: "BusTableViewCell", bundle: nil), forCellReuseIdentifier: BusCellID)
    return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        HeaderView()
        Refresh()
//        loadData()
        

    }
    
    func Refresh(){
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.loadData()
            self?.tableView.dg_stopLoading()
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
    func HeaderView() {
        
        let headerView = UIView(frame:
            CGRect(x:0, y:64-44, width:ScreenW, height:30))
        
        let headerlabel:UILabel = UILabel(frame: headerView.bounds)
        headerlabel.textColor = UIColor.lightGray
        headerlabel.backgroundColor = UIColor.groupTableViewBackground
        headerlabel.font = UIFont.systemFont(ofSize: 13)
        headerlabel.text = "推荐路线"
        headerView.addSubview(headerlabel)
        headerView.backgroundColor = UIColor.groupTableViewBackground
        tableView.tableHeaderView = headerView
    }


}

// MARK:- 请求数据
extension BusViewController {
    func loadData() {
        BusVM.loadBusData {
            
            self.tableView.reloadData()
        }
        
    }
}


// MARK:- 遵守UITableView的数据源&代理
extension BusViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BusVM.bus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BusCellID, for: indexPath) as! BusTableViewCell
        cell.busmodel = BusVM.bus[indexPath.item]
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
