//
//  ActivityModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ActivityModel: NSObject {

    var ALLAmount: String = ""
//    var commuteAmount: String = ""
    var date: String = ""
//    var expressAmount: String = ""
//    var intercityAmount: String = ""
//    var qualityAmount: String = ""
//    var shuttleAmount: String = ""
//    var subwayShuttleAmount: String = ""
    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
