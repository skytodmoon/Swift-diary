//
//  String+Extension.swift
//  爱鲜蜂(Swift)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension String {
    
    //MARK: - 清除字符串小数点末尾的0
    func cleanDecimalPointZear() -> String {
        
        let newStr = self as NSString
        var s = NSString()
        var offset = newStr.length - 1
        while offset > 0 {
            s = newStr.substringWithRange(NSMakeRange(offset, 1))
            if s.isEqualToString("0") || s.isEqualToString(".") {
                offset -= 1
            } else {
                break
            }
        }
        return newStr.substringToIndex(offset + 1)
    }
}