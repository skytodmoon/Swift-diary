//
//  UITextField+Extension.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

extension UITextField
{    
    // 初始化的时候, 光标多出来一点间距, 原本在OC可以使用上面这个方法, 但是swift中貌似不行
    convenience init(frame: CGRect, isPlaceHolderSpace: Bool) {
        self.init(frame: frame)
        
        if isPlaceHolderSpace {
            let space = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            leftView = space
            leftViewMode = .Always
        }
    }
    
    // 判断当前的textfiled的值是否为空
    func isNil() -> Bool {
        if text?.characters.count < 1 {
            return true
        }
        return false
    }

}
