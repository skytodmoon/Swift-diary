//
//  MoreViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let kProfileCellID = "kProfileCellID"


private let Activity  = "活动账单"
private let Coupon = "我的优惠券"
private let Address  = "设置家/工作地址"


private let Problem  = "常见问题"
private let Userguide = "用户指南"
private let Agreement = "使用协议"
private let Aboutme  = "关于我们"
private let Proposal = "投诉建议"

private let ProblemURL  = "http://www.youdianbus.cn/ydbus-static/problem.html"
private let UserguideURL = "http://www.youdianbus.cn/ydbus-static/user-guide.html"
private let AgreementURL = "http://www.youdianbus.cn/ydbus-static/agreement.html"
private let AboutmeURL  = "http://www.youdianbus.cn/ydbus-static/about-us.html"


class MoreViewController: UIViewController {
    
    // MARK:- 普通属性
    var lightFlag: Bool = true
    
    /// 列表标题数组
    fileprivate lazy var titleArray:[[String]] = {
        return [[Activity, Coupon,Address],
                [Problem, Userguide, Agreement, Aboutme, Proposal]]
    }()
    /// 列表图标数组
    lazy var imageArray:[[String]] = {
        return [["icon_set", "icon_ComplaintAndSuggest","icon_more_3"],
                ["icon_more_4", "icon_more_5", "icon_more_6", "icon_more_7", "icon_more_8"]]
    }()
    
    /// tableView
    fileprivate lazy var tableView : UITableView = {
        let rect = CGRect(x: 0, y: 64, width: ScreenW, height: ScreenH - 49)
        let tableView = UITableView(frame: rect, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(tableView)
        tableView.rowHeight = 44.0
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kProfileCellID)
        setUpMainView()
        
    }
    
    // MARK:- 设置状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if lightFlag {
            return .lightContent
        } else {
            return .default
        }
    }
    /// 状态栏
    lazy var statusBackView: UIView = { [unowned self] in
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenW, height: 20))
        view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        self.view.addSubview(view)
        self.view.bringSubview(toFront: view)
        return view
        }()
}

extension MoreViewController {
    
    fileprivate func setUpMainView() {
        // 创建一个导航栏
        let navBar = UINavigationBar(frame: CGRect(x:0, y:00, width:ScreenW, height:64))
        // 导航栏背景颜色
        navBar.backgroundColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0)
        // 自定义导航栏的title，用UILabel实现
        let titleLabel = UILabel(frame: CGRect(x:0,y:0,width:50,height:60))
        titleLabel.text = "更多"
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

// MARK: --  UITableView的数据源和代理方法
extension MoreViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let subTitle = titleArray[indexPath.section]
        let imageArr = imageArray[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kProfileCellID, for: indexPath)
        
        
        cell.textLabel?.text = subTitle[indexPath.row]
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        
        cell.imageView?.image = UIImage(named: imageArr[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        guard let title = cell?.textLabel?.text else {
            return
        }
        
        if title == Activity {
            ActivityVC()
        }else if title == Coupon {
            CouponVC()
        }else if title == Address {
            AddressVC()
        }else if title == Problem{
            ProblemVC()
        }else if title == Userguide{
            UserguideVC()
        }else if title == Agreement {
            AgreementVC()
        }else if title == Aboutme{
            AboutmeVC()
        }else if title == Proposal {
            ProposalVC()
        }
    }
    
}

// MARK:- 界面跳转
extension MoreViewController {
    fileprivate func ActivityVC() {
        

        print(1)
    }
    fileprivate func CouponVC() {
        //        let settingVc = XJSettingViewController()
        //        settingVc.hidesBottomBarWhenPushed = true
        //        navigationController?.pushViewController(settingVc, animated: true)
        print(2)
    }
    fileprivate func AddressVC() {
        print(3)
    }
    fileprivate func ProblemVC() {
        let problemVC = ProblemViewController()
        problemVC.urlString = ProblemURL
        self.present(problemVC, animated: true)
    }
    fileprivate func UserguideVC() {
        print(5)
        let userguideVC = UserguideViewController()
        userguideVC.urlString = UserguideURL
        self.present(userguideVC, animated: true)
    }
    fileprivate func AgreementVC() {
        print(6)
        let agreementVC = ProblemViewController()
        agreementVC.urlString = AgreementURL
        self.present(agreementVC, animated: true)
    }
    fileprivate func AboutmeVC() {
        print(7)
        let aboutmeVC = ProblemViewController()
        aboutmeVC.urlString = AboutmeURL
        self.present(aboutmeVC, animated: true)
    }
    fileprivate func ProposalVC() {
        print(88)
    }
}


