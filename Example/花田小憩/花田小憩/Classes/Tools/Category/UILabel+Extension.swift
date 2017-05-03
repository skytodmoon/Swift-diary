//
//  UILabel+Extension.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UILabel
{
    convenience init(textColor: UIColor, font: UIFont) {
        self.init()
        self.font = font
        self.textColor = textColor
    }
}
