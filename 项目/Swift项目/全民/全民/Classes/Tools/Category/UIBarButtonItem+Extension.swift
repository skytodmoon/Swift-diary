//
//  UIBarButtonItem-Extension.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName : String, highlightedImage : String = "" , size : CGSize = CGSize.zero, target:UIViewController, action:Selector) {
        let btn = UIButton()
        btn.setImage(UIImage(named : imageName), for: .normal)
        if highlightedImage != ""{
            btn.setImage(UIImage(named : highlightedImage), for: .highlighted)
        }
        if size != CGSize.zero{
            btn.frame = CGRect (origin: CGPoint.zero, size: size)
        }else
        {
            btn.sizeToFit()
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: btn)
    }
}
