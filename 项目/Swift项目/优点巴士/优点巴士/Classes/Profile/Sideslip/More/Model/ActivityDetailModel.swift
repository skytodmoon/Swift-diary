//
//  ActivityDetailModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON

class ActivityDetailModel: NSObject {
    
    
    
    var startStationName: String = ""
    var date: String = ""

    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    

    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
