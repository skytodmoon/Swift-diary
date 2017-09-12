//
//  BusViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh
import Alamofire
import SwiftyJSON
import Kingfisher

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
    tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: 160))
    tableView.addSubview(self.headerView)
    tableView.register(UINib(nibName: "BusTableViewCell", bundle: nil), forCellReuseIdentifier: BusCellID)
    return tableView
    }()
    
    /// headerView
    fileprivate lazy var headerView : UIImageView = {
        let rect = CGRect(x: 0, y: 0, width: ScreenW, height: 160)
        let headerView = UIImageView(frame: rect)
        return headerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        Refresh()
        loadData()
        loadHeadViewData()

    }
    
    func Refresh(){
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.white
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            self?.tableView.dg_stopLoading()
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
    func loadHeadViewData ()  {
        Alamofire.request("http://www.youdianbus.cn/ydbus-api/api/events/rotation", method: .get, parameters: nil).responseJSON { (response) in
            if let value = response.result.value {
                let dict = JSON(value)
                let dataDict = dict["data"].dictionary
                if let eventsList = dataDict?["eventsList"]?.array{
                    for line in eventsList {
                        let imgUrl = line["imgUrl"].stringValue
                        guard let iconURL = URL(string: imgUrl) else { return }
                        self.headerView.kf.setImage(with: iconURL)
                    }
                }
            }
        }
        
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
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.busmodel = BusVM.bus[indexPath.item]
        return cell
    }
    
    //返回分区头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.groupTableViewBackground
        let titleLabel = UILabel()
//        titleLabel.text = self.adHeaders?[section]
        titleLabel.text = "推荐线路"
        titleLabel.textColor = UIColor.darkGray
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: self.view.frame.width/8, y: 15)
        headerView.addSubview(titleLabel)
        return headerView
    }
    
    //返回分区头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
