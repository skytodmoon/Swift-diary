//
//  TransitModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TransitModel: NSObject {
    
    var station_name: String = ""
    var station_direction: String = ""
    var distance: Int = 0
    
    override init() {
        
    }
    
    init(dict:[String: Any]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
