//
//  TransitViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


private let transitCellID = "transitCellID"

class TransitViewController: UIViewController {
    
    // MARK: 懒加载属性
    fileprivate lazy var transitVM : TransitModelView = TransitModelView()
    
    fileprivate lazy var headerView : UITableView = {[unowned self] in
        let rect = CGRect(x: 0, y: 0, width: ScreenW, height: 160)
        let headerView = UITableView(frame: rect)
        headerView.backgroundColor = UIColor.red
        return headerView
        }()
    
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        let rect = CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH-64-40)
        let tableView = UITableView(frame: rect)
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: 160))
        tableView.addSubview(self.headerView)
        tableView.register(UINib(nibName: "TransitViewCell", bundle: nil), forCellReuseIdentifier: transitCellID)
        return tableView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        loadData()
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
}

// MARK:- 遵守UITableView的数据源&代理
extension TransitViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transitVM.transitModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: transitCellID, for: indexPath) as! TransitViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.transitmodel = transitVM.transitModel[indexPath.item]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //返回分区头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.groupTableViewBackground
        let titleLabel = UILabel()
        //        titleLabel.text = self.adHeaders?[section]
        titleLabel.text = "附近站点"
        titleLabel.textColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0)
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: self.view.frame.width/8, y: 15)
        headerView.addSubview(titleLabel)
        
        let titleLabel2 = UILabel()
        titleLabel2.text = "直线距离/辐射半径1.5km"
        titleLabel2.textColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0)
        titleLabel2.font = UIFont.systemFont(ofSize: 12)
        titleLabel2.sizeToFit()
        titleLabel2.center = CGPoint(x: self.view.frame.width-70, y: 15)
        headerView.addSubview(titleLabel2)
        
        return headerView
    }
    
    //返回分区头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}
