//
//  SettingCell.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    var setting: Setting? {
        didSet{
            nameLablel.text = setting?.name.rawValue
            
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let nameLablel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFontOfSize(13)
        return label
    }()
    
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "settings")
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()

    override func setupViews() {
        super.setupViews()
        addSubview(nameLablel)
        addSubview(iconImageView)
        
        
        addConstraintsWithFormat("H:|-8-[v0(30)]-8-[v1]|", views: iconImageView,nameLablel)
        addConstraintsWithFormat("V:|[v0]|", views: nameLablel)
        addConstraintsWithFormat("V:[v0(30)]", views: iconImageView)
        
        addConstraint(NSLayoutConstraint(item: iconImageView,attribute: .CenterY,relatedBy: .Equal,toItem: self,attribute: .CenterY, multiplier: 1,constant: 0))
    }
}
