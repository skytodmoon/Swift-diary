//
//  RecommendUser.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class RecommendUser: NSObject {
    var header: String = ""
    var fans_count: Int = 0
    var screen_name: String = ""
    
    init(dict: [String : Any]) {
        super.init()
        
        header = dict["header"] as! String
        fans_count = dict["fans_count"] as! Int
        screen_name = dict["screen_name"] as! String
    }
}
