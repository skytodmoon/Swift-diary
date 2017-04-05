//
//  ProfileTopButton.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ProfileTopButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.textAlignment = .Center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: (frame.size.width - 22) * 0.5, y: 15, width: 22, height: 22)
        titleLabel?.frame = CGRect(x: 0, y: 38, width: frame.size.width, height: 20)
    }

}
