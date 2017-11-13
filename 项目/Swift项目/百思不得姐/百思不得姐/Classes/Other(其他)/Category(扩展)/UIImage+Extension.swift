//
//  UIImage+Extension.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

extension UIImage {
    
    public func cicleImage() -> UIImage {
        
        // 开启图形上下文 false代表透明
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        // 获取上下文
        
        let ctx = UIGraphicsGetCurrentContext()
        
        // 添加一个圆
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        ctx?.addEllipse(in: rect)
        
        // 裁剪
        ctx?.clip()
        
        // 将图片画上去
        draw(in: rect)
        
        // 获取图片
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
    
}
