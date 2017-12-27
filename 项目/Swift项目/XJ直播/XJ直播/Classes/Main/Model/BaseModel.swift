//
//  BaseModel.swift
//  XJ直播
//
//  Created by 金亮齐 on 2017/12/26.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    
    override init() {
        
    }
    
    init(dict:[String: Any]) {
        super.init()
        setValuesForKeys(dict)
        
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
