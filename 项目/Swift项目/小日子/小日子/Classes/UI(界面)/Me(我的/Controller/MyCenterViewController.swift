//
//  MyCenterViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/22.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MyCenterViewController: UIViewController {

    @IBOutlet weak private var alterPwdView: UIView!
    @IBOutlet weak private var iconView: IconView!
    @IBOutlet weak var accountLabel: UILabel!
    
    init() {
        super.init(nibName: "MyCenterViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(nibName: "MyCenterViewController", bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MyCenterViewController.alterPwdViewClick))
        alterPwdView.userInteractionEnabled = true
        alterPwdView.addGestureRecognizer(tap)
        accountLabel.text = UserAccountTool.userAccount()!
        
        if let data = NSData(contentsOfFile: SD_UserIconData_Path) {
            let image: UIImage = UIImage(data: data)!
            iconView.iconButton.setImage(image.imageClipOvalImage(), forState: .Normal)
        }
    }
    
    func alterPwdViewClick() {
        print("修改密码", terminator: "")
    }
    
    @IBAction func logoutBtnClick(sender: UIButton) {
        let user = NSUserDefaults.standardUserDefaults()
        user.setObject(nil, forKey: SD_UserDefaults_Account)
        user.setObject(nil, forKey: SD_UserDefaults_Password)
        if user.synchronize() {
            navigationController!.popViewControllerAnimated(true)
        }
        do {
            // 将本地的icon图片data删除
            try NSFileManager.defaultManager().removeItemAtPath(SD_UserIconData_Path)
        } catch _ {
        }
    }
    
    deinit {
        print("个人中心控制器被销毁", terminator: "")
    }
}
