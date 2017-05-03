//
//  Pay.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class Pay: NSObject {
    
    /// 图标
    var icon : UIImage?
    /// 机构名称
    var title : String?
    /// 支付描述
    var des : String?
    
    init(dict:[String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }


}
