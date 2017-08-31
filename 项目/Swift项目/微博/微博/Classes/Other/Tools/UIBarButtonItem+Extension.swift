//
//  UIBarButtonItem+Extension.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    //MARK - 抽取导航栏按钮
    class func creatBarButtonItem(imageName:String,target:AnyObject?,action:Selector) ->UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
    }
    
    convenience init(imageName: String, target: AnyObject?, action: String?) {
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        if action != nil {
            btn.addTarget(target, action: Selector(action!), for: UIControlEvents.touchUpInside)
        }
        btn.sizeToFit()
        self.init(customView: btn)
    }
}

