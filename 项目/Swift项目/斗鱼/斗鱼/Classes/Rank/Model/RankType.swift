//
//  RankType.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class RankType: NSObject {
    
    var typeName: String = ""
    var typeNum: Int = 0
    
    init(typeName: String, typeNum:Int) {
        
        self.typeName = typeName
        self.typeNum = typeNum
    }
}
