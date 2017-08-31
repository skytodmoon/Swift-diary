//
//  WelcomeViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Kingfisher

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgIV)
        view.addSubview(iconView)
        view.addSubview(messageLabel)
        
        bgIV.snp.makeConstraints { (make) in
            make.size.equalTo(view)
            make.center.equalTo(view)
        }
        
        iconView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.centerX.equalTo(view)
            make.top.equalTo(view.snp.top).offset(200)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        
        if let iconUrl = UserAccount.loadAccount()?.avatar_large{
            let url = URL(string: iconUrl)!
            iconView.kf.setImage(with: url)
        }

        // Do any additional setup after loading the view.
}

    //MARK: - 设置用户的动画
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            self.iconView.snp.updateConstraints({ (make) -> Void in
                make.top.equalTo(self.view.snp.top).offset(100)
            })
            self.view.layoutIfNeeded()
        }) { (_) -> Void in
            UIView.animate( withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
                self.messageLabel.alpha = 1.0
            }, completion: { (_) -> Void in
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: SwitchRootViewControllerKey), object: true)
            })
        }
    }

    //MARK: - 懒加载用户的头像
    private var bgIV: UIImageView = UIImageView(image: UIImage(named: "ad_background"))
    //MARK: - 用户头像圆形
    private var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "avatar_default_big"))
        iv.layer.cornerRadius = 50
        iv.clipsToBounds = true
        return iv
    }()
    //MARK: - 懒加载UILable
    private var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "欢迎回来"
        label.sizeToFit()
        label.alpha = 0.0
        return label
    }()
}


