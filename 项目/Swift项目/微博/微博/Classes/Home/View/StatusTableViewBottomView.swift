//
//  StatusTableViewBottomView.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class StatusTableViewBottomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    //MARK: - 设置UI界面
    private func setupUI(){
        backgroundColor = UIColor(white: 0.902, alpha: 0.5)
        
        addSubview(retweetBtn)
        addSubview(unlikeBtn)
        addSubview(commonBtn)
        
        retweetBtn.snp_makeConstraints { (make) -> Void in
            make.left.top.equalTo(self)
            make.height.equalTo(self).offset(-3)
            make.width.equalTo(unlikeBtn.snp_width)
        }
        commonBtn.snp_makeConstraints { (make) -> Void in
            make.height.width.top.equalTo(retweetBtn)
            make.left.equalTo(retweetBtn.snp_right)
        }
        unlikeBtn.snp_makeConstraints { (make) -> Void in
            make.height.width.top.equalTo(commonBtn)
            make.left.equalTo(commonBtn.snp_right)
            make.right.equalTo(self)
        }

    }

    //MARK: - 懒加载三个按钮
    private lazy var retweetBtn: UIButton = UIButton.createButton("timeline_icon_retweet", title: "转发")
    
    private lazy var unlikeBtn: UIButton = UIButton.createButton("timeline_icon_unlike", title: "赞")
    
    private lazy var commonBtn: UIButton = UIButton.createButton("timeline_icon_comment", title: "评论")

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
