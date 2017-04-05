//
//  InfoHeaderView.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import YYWebImage
import SnapKit

class InfoHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        backgroundColor = UIColor.whiteColor()
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        addSubview(levelLabel)
        addSubview(pointsLabel)
        
        avatarImageView.snp_makeConstraints { (make) in
            make.left.equalTo(MARGIN)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        usernameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp_right).offset(20)
            make.top.equalTo(avatarImageView).offset(2)
        }
        
        levelLabel.snp_makeConstraints { (make) in
            make.left.equalTo(usernameLabel)
            make.bottom.equalTo(avatarImageView).offset(-2)
        }
        
        pointsLabel.snp_makeConstraints { (make) in
            make.top.equalTo(avatarImageView)
            make.right.equalTo(-MARGIN)
        }
        
        avatarImageView.yy_setImageWithURL(NSURL(string: AccountModel.shareAccount()!.avatarUrl!), options: YYWebImageOptions.AllowBackgroundTask)
        usernameLabel.text = AccountModel.shareAccount()!.username!
        levelLabel.text = "等级：\(AccountModel.shareAccount()!.groupName!)"
        pointsLabel.text = "\(AccountModel.shareAccount()!.points!)积分"
    }
    
    // MARK: - 懒加载
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.layer.masksToBounds = true
        return avatarImageView
    }()
    
    private lazy var usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        return usernameLabel
    }()
    
    private lazy var levelLabel: UILabel = {
        let levelLabel = UILabel()
        levelLabel.font = UIFont.systemFontOfSize(13)
        levelLabel.textColor = UIColor.grayColor()
        return levelLabel
    }()
    
    private lazy var pointsLabel: UILabel = {
        let pointsLabel = UILabel()
        pointsLabel.font = UIFont.systemFontOfSize(13)
        pointsLabel.textColor = UIColor.grayColor()
        return pointsLabel
    }()
    
}

