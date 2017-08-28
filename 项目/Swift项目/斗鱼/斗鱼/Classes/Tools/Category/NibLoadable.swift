//
//  NibLoadable.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

/**
 在协议/结构体/枚举里面 如果要定义类方法,需要用 static 修饰
 在类里面定义类方法, 这时候用 class 修饰
 */
protocol NibLoadable {
    
    
}

extension NibLoadable where Self : UIView{
    
    static func loadFromNib(_ nibname : String? = nil) -> Self {
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
    
}

