//
//  UIBarButtonItem+Extension.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    //便利构造函数:
    convenience init(imageName : String, highImageName : String = "", size: CGSize = CGSize.zero) {
        //创建UIButton
        let btn = UIButton()
        
        //创建btn的图片
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: UIControlState())
        }
        //设置btn的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        //创建UIBarbuttonItem
        self.init(customView : btn)
    }
}
