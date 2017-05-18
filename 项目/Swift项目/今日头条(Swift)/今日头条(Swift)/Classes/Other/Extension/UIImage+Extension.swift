//
//  UIImage+Extension.swift
//  今日头条(Swift)
//
//  Created by 金亮齐 on 2017/5/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIImage {
    
    func circleImage() -> UIImage {
        // false 代表透明
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        // 获得上下文
        let ctx = UIGraphicsGetCurrentContext()
        // 添加一个圆
        let rect = CGRectMake(0, 0, size.width, size.height)
        CGContextAddEllipseInRect(ctx, rect)
        
        // 裁剪
        CGContextClip(ctx)
        // 将图片画上去
        drawInRect(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 关闭上下文
        UIGraphicsEndImageContext()
        
        return image
    }
}
