
//
//  UIButton+Extension.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIButton
{
    convenience init(title: String?, imageName: String?, target: AnyObject? ,selector: Selector?, font: UIFont?, titleColor: UIColor?) {
        self.init()
        if let imageN = imageName {
            setImage(UIImage(named:imageN), forState: .Normal)
        }
        setTitleColor(titleColor, forState: .Normal)
        titleLabel?.font = font
        setTitle(title, forState: .Normal)
        if let sel = selector {
            addTarget(target, action: sel, forControlEvents: .TouchUpInside)
        }
        
    }
}
