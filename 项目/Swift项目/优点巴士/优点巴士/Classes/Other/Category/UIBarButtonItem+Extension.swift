//
//  UIBarButtonItem+Extension.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero, target: Any,action: Selector)  {
        // 1.创建UIButton
        let btn = UIButton()
        
        // 2.设置btn的图片
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        // 3.设置btn的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        // 4.创建UIBarButtonItem
        self.init(customView : btn)
    }
    
    class func createItem(_ imageName: String, highImageName: String = "", size: CGSize  = CGSize.zero) -> UIBarButtonItem {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        
        btn.frame = CGRect(origin: CGPoint.zero, size: size)
        btn.sizeToFit()
        
        return UIBarButtonItem(customView: btn)
    }
    
}

