//
//  StatusNormalTableViewCell.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class StatusNormalTableViewCell: StatusTableViewCell {
    
    override func setupUI() {
        super.setupUI()
        pictureView.snp_makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp_bottom).offset(10)
            make.left.equalTo(contentLabel.snp_left)
        }
    }

}
