//
//  EditProfileViewController.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class EditProfileViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "账号管理"
        
        let group1CellModel1 = ProfileCellArrowModel(title: "修改资料", destinationVc: ModifyInfoTableViewController.classForCoder())
        let group1CellModel2 = ProfileCellArrowModel(title: "修改安全信息", destinationVc: ModifySafeTableViewController.classForCoder())
        let group1 = ProfileCellGroupModel(cells: [group1CellModel1, group1CellModel2])
        
        let group2CellModel1 = ProfileCellLabelModel(title: "注册时间", text: AccountModel.shareAccount()!.registerTime!)
        let group2CellModel2 = ProfileCellLabelModel(title: "我的积分", text: AccountModel.shareAccount()!.points!)
        let group2CellModel3 = ProfileCellLabelModel(title: "我的等级", text: AccountModel.shareAccount()!.groupName!)
        let group2 = ProfileCellGroupModel(cells: [group2CellModel1, group2CellModel2, group2CellModel3])
        
        groupModels = [group1, group2]
        
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 {
            return 20
        } else {
            return 0.1
        }
    }
    
    /**
     退出登录点击
     */
    func didTappedLogoutButton(button: UIButton) -> Void {
        
        let alertC = UIAlertController(title: "确定注销登录状态？", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let action1 = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (action) in
            AccountModel.logout()
            ProgressHUD.showSuccessWithStatus("退出成功")
            self.navigationController?.popViewControllerAnimated(true)
        }
        let action2 = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel) { (action) in
            
        }
        alertC.addAction(action1)
        alertC.addAction(action2)
        presentViewController(alertC, animated: true) {}
    }
    
    // MARK: - 懒加载
    /// 头部视图
    private lazy var headerView: InfoHeaderView = {
        let headerView = InfoHeaderView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 70))
        return headerView
    }()
    
    /// 尾部退出视图
    private lazy var footerView: UIView = {
        let logoutButton = UIButton(frame: CGRect(x: 20, y: 0, width: SCREEN_WIDTH - 40, height: 44))
        logoutButton.addTarget(self, action: #selector(didTappedLogoutButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        logoutButton.setTitle("退出登录", forState: UIControlState.Normal)
        logoutButton.backgroundColor = NAVIGATIONBAR_RED_COLOR
        logoutButton.layer.cornerRadius = CORNER_RADIUS
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 44))
        footerView.addSubview(logoutButton)
        return footerView
    }()
}
