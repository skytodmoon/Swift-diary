//
//  VisitorView.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SnapKit

//MARK: - 设置代理方法
protocol VisitorViewDelegate:NSObjectProtocol {
    
    func loginBtnDidClick()
    
    func registerBtnClick()
}

class VisitorView: UIView {
    
    weak var delegate: VisitorViewDelegate?

    
    //MARK: - 访客界面配置，是否有首页，图片名，文字信息
    func setupVisitorInfo(isHome: Bool, imageName: String, message: String) {
        
        iconView.hidden = !isHome
        homeIcon.image = UIImage(named: imageName)
        messageLable.text = message
        StartAnimation()
    }
    
    //MARK: - 初始化视图
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(iconView)
        addSubview(maskBackgroundView)
        addSubview(homeIcon)
        addSubview(messageLable)
        addSubview(loginButton)
        addSubview(registerButton)
        
        
        //MARK: - SnapKit自动布局子控件
        iconView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        homeIcon.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        messageLable.snp_makeConstraints { (make) in
            make.top.equalTo(iconView.snp_bottom)
            make.centerX.equalTo(self)
            make.width.equalTo(220)
        }
        registerButton.snp_makeConstraints { (make) in
            make.top.equalTo(messageLable.snp_bottom)
            make.left.equalTo(messageLable.snp_left)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        loginButton.snp_makeConstraints { (make) in
            make.top.equalTo(messageLable.snp_bottom)
            make.right.equalTo(messageLable.snp_right)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        maskBackgroundView.snp_makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 转盘
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return imageView
    }()
    
    //MARK: - 图标
    private lazy var homeIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return image
    }()
    
    //MARK: - 文本
    private lazy var messageLable: UILabel = {
        let label = UILabel()
        label.text = "我是醉看红尘这场梦,这是我仿写的新浪微博项目"
        label.textColor = UIColor.grayColor()
        label.numberOfLines = 0
        label.textAlignment = .Center
        return label
    }()
    
    //MAKR: - 登录按钮
    private lazy var loginButton: UIButton = {
       let loginButton = UIButton()
       loginButton.setTitle("登录", forState: .Normal)
       loginButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
       loginButton.addTarget(self, action: #selector(VisitorView.loginButtonClick), forControlEvents: .TouchUpInside)
       loginButton.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        return loginButton
    }()
    
    //MAKR: - 注册按钮
    private lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.setTitle("注册", forState: .Normal)
        registerButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        registerButton.addTarget(self, action: #selector(VisitorView.registerButtonClick), forControlEvents: .TouchUpInside)
        registerButton.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        return registerButton
    }()
    
    //MARK: - 图片
    private lazy var maskBackgroundView: UIImageView = {
        let maskView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return maskView
    }()
    
    //MARK: - 设置动画
    private func StartAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = M_PI * 2
        animation.duration = 20
        animation.repeatCount = MAXFLOAT
        animation.removedOnCompletion = false
        iconView.layer.addAnimation(animation, forKey: nil)
    }
    
    func loginButtonClick() {
        delegate?.loginBtnDidClick()
    }
    
    func registerButtonClick() {
        delegate?.registerBtnClick()
    }
}
