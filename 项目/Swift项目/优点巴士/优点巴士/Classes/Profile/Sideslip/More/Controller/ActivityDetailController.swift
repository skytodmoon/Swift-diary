//
//  ActivityDetailController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let activityDetailCellID = "activityDetailCellID"

class ActivityDetailController: UIViewController {
    
    
    // MARK: 懒加载属性
    fileprivate lazy var activityDetailVM : ActivityDetailViewModel = ActivityDetailViewModel()
    
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        
        
        let rect = CGRect(x: 0, y: 64, width: ScreenW, height: ScreenH - 64)
        let tableView = UITableView(frame: rect)
        tableView.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(UINib(nibName: "ActivityDetailTableViewCell", bundle: nil), forCellReuseIdentifier: activityDetailCellID)
        return tableView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpMainView()
        
        view.addSubview(tableView)
        loadData()
        // Do any additional setup after loading the view.
    }


}

// MARK:- 请求数据
extension ActivityDetailController {
    
    func loadData() {
        activityDetailVM.loadactivityDetailData{
            
            self.tableView.reloadData()
        }
        
    }
}


extension ActivityDetailController {
    
    fileprivate func setUpMainView() {
        // 创建一个导航栏
        let navBar = UINavigationBar(frame: CGRect(x:0, y:00, width:ScreenW, height:64))
        // 导航栏背景颜色
        navBar.backgroundColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0)
        // 自定义导航栏的title，用UILabel实现
        let titleLabel = UILabel(frame: CGRect(x:0,y:0,width:50,height:60))
        titleLabel.text = "账单详情"
        titleLabel.textColor = UIColor.white
        // 创建导航栏组件
        let navItem = UINavigationItem()
        // 设置自定义的title
        navItem.titleView = titleLabel
        // 创建左侧按钮
        let img=UIImage(named: "icon_left")
        let leftButton = UIBarButtonItem(image: img?.withRenderingMode(.alwaysOriginal), style: UIBarButtonItemStyle.plain, target: self, action: #selector(MoreViewController.leftItem(_:)))
        self.navigationItem.rightBarButtonItem = leftButton
        // 添加左侧、右侧按钮
        navItem.setLeftBarButton(leftButton, animated: false)
        // 把导航栏组件加入导航栏
        navBar.pushItem(navItem, animated: false)
        // 导航栏添加到view上
        self.view.addSubview(navBar)
    }
    
    func leftItem(_ btn: UIButton) {
        self.dismiss(animated: true)
    }
}

// MARK:- 遵守UITableView的数据源&代理
extension ActivityDetailController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityDetailVM.activityDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: activityDetailCellID, for: indexPath) as! ActivityDetailTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.activitDetailmodel = activityDetailVM.activityDetail[indexPath.item]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

