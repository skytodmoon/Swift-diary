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
    
    weak var delegate: VisitorViewDelegate

    
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
    
    
    
    func loginBtnDidClick() {
    
    }
    
    func registerBtnClick() {
    
    }
}
