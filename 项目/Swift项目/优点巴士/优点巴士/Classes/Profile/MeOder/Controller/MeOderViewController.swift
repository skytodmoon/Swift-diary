//
//  MeOderViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeOderViewController: UIViewController {
    
    // MARK: 懒加载属性
    fileprivate lazy var meorderVM : MeOderViewModel = MeOderViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpMainView()
        loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:- 请求数据
extension MeOderViewController {
    
    func loadData() {
        meorderVM.loadorderData{
            
        }
        
    }
}

extension MeOderViewController {
    
    fileprivate func setUpMainView() {
        // 创建一个导航栏
        let navBar = UINavigationBar(frame: CGRect(x:0, y:00, width:ScreenW, height:64))
        // 导航栏背景颜色
        navBar.backgroundColor = UIColor(red: 51/255, green: 145/255, blue: 232/255, alpha: 1.0)
        // 自定义导航栏的title，用UILabel实现
        let titleLabel = UILabel(frame: CGRect(x:0,y:0,width:50,height:60))
        titleLabel.text = "我的订单"
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

