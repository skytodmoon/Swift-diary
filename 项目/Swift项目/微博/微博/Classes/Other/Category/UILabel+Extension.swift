//
//  UILabel+Extension.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UILabel {
    
    //MARK: - 快速创建UILabel
    class func createLabel(color: UIColor, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
}
