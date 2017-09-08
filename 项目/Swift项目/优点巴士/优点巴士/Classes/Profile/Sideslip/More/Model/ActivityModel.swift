//
//  ActivityModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ActivityModel: NSObject {

    var ALLAmount: Double = 0
    var commuteAmount: Double = 0
    var date: String = ""
    var intercityAmount: Double = 0
    var qualityAmount: Double = 0

    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
