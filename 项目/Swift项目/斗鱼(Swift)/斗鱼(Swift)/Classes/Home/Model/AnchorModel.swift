//
//  AnchorModel.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    
    var room_id : Int = 0
    
    var vertical_src : String = ""
    
    var isVertical : Int = 0
    
    var room_name : String = ""
    
    var nickName : String = ""
    
    var online : Int = 0
    
    
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
