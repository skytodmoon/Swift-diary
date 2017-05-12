//
//  LeftImageRightTextButton.swift
//  爱鲜蜂(Swift)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.

import UIKit

class LeftImageRightTextButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.font = UIFont.systemFontOfSize(15)
        imageView?.contentMode = UIViewContentMode.Center
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.frame = CGRectMake(0, (height - (imageView?.size.height)!) * 0.5, (imageView?.size.width)!, (imageView?.size.height)!)
        titleLabel?.frame = CGRectMake((imageView?.size.width)! + 10, 0, width - (imageView?.size.width)! - 10, height)
    }
}
