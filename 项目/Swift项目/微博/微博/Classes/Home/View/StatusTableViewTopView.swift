//
//  StatusTableViewTopView.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class StatusTableViewTopView: UIView {
    
    var status: Status?
        {
        didSet{
            nameLabel.text = status?.user?.name
            if let url = status?.user?.imageURL
            {
                iconView.kf_setImageWithURL(url)
            }
            verifiedView.image = status?.user?.verifiedImage
            vipView.image = status?.user?.mbrankImage
            sourceLabel.text = status?.source
            timeLabel.text = status?.created_at
        }
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        
        addSubview(iconView)
        addSubview(verifiedView)
        addSubview(nameLabel)
        addSubview(vipView)
        addSubview(timeLabel)
        addSubview(sourceLabel)
        
        iconView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.height.width.equalTo(50)
        }
        
        verifiedView.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(iconView).offset(5)
            make.bottom.equalTo(iconView).offset(5)
            make.height.width.equalTo(14)
        }
        
        nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(iconView)
            make.left.equalTo(iconView.snp_right).offset(10)
        }
        
        vipView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(nameLabel)
            make.left.equalTo(nameLabel.snp_right).offset(10)
            make.height.width.equalTo(14)
        }
        
        timeLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(iconView)
            make.left.equalTo(iconView.snp_right).offset(10)
        }
        
        sourceLabel.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(timeLabel)
            make.left.equalTo(timeLabel.snp_right)
        }

    }
    
    //MARK: - 头像
    private lazy var iconView: UIImageView =
        {
            let iv = UIImageView(image: UIImage(named: "avatar_default_big"))
            return iv
    }()
    //MARK: - 认证图标
    private lazy var verifiedView: UIImageView = UIImageView(image: UIImage(named: "avatar_enterprise_vip"))
    
    //MARK: - 昵称
    private lazy var nameLabel: UILabel = UILabel.createLabel(UIColor.darkGrayColor(), fontSize: 14)
    
    //MARK:  - 会员图标
    private lazy var vipView: UIImageView = UIImageView(image: UIImage(named: "common_icon_membership"))
    
    //MARK:  - 时间
    private lazy var timeLabel: UILabel = UILabel.createLabel(UIColor.darkGrayColor(), fontSize: 14)
    //MARK:  - 来源
    private lazy var sourceLabel: UILabel = UILabel.createLabel(UIColor.darkGrayColor(), fontSize: 14)
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
