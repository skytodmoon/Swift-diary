//
//  CityViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import ZHDropDownMenu

private let CityCellID = "CityCellID"

class CityViewController: UIViewController {
    
    
    fileprivate lazy var HeaderView : UIView = {[unowned self] in
        
        let headerview = ZHDropDownMenu()
        headerview.frame = CGRect(x: 0, y: 0, width: ScreenW, height: 44)
        //设置下拉列表项数据
        headerview.options = ["北京","深圳","上海","厦门","广州"]
        //设置最大高度
        headerview.menuHeight = 240;
        //设置默认值
        headerview.defaultValue = "深圳"
        headerview.buttonImage = UIImage(named:"icon_cityBus_head_down.png")

        return headerview
    }()
    
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        let rect = CGRect(x: 0, y: 44, width: ScreenW, height: ScreenH-64-44-44)
        let tableView = UITableView(frame: rect)
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: CityCellID)
        return tableView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.view.addSubview(HeaderView)
        self.view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }



}


// MARK:- 遵守UITableView的数据源&代理
extension CityViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CityCellID, for: indexPath) as! CityTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
