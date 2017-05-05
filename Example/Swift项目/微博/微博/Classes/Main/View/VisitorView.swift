//
//  VisitorView.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

//MARK: - 设置代理方法
protocol VisitorViewDelegate:NSObjectProtocol {
    
    func loginBtnDidClick()
    
    func registerBtnClick()
}

class VisitorView: UIView {
    
    weak var delegate: VisitorViewDelegate?

    
    //MARK: - 访客界面配置，是否有首页，图片名，文字信息
    func setupVisitorInfo(isHome: Bool, imageName: String, message: String) {
        
    }
    
    //MARK: - 初始化视图
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        label.text = "我是醉看红尘这场梦,这是我仿写的新浪微博项目,用来学习Swift2.0"
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
        registerButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
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
        delegate?.registerBtnClick()
    }
    
    func registerButtonClick() {
        delegate?.loginBtnDidClick()
    }
}
