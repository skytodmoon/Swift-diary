//
//  CityModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class CityModel: NSObject {

    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
