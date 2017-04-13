//
//  UIColor+Extension.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UIColor{
    
    class func randomColor() -> UIColor {
        
        return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber() , alpha: 1.0)
    }
    
    class func randomNumber() -> CGFloat {
        // 0 ~ 255
        return CGFloat(arc4random_uniform(255)) / CGFloat(255)
    }
    
    class func tintColor() -> UIColor {
        return UIColor(red: 223 / 255.0, green: 52 / 255.0, blue: 46 / 255.0 , alpha: 1.0)
    }
    
    /**设置统一颜色的扩展*/
    class func colorWith(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        return color
    }
    
}
