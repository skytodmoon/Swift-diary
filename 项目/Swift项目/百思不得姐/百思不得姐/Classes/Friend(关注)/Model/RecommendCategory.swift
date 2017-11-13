//
//  RecommendCategory.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class RecommendCategory: NSObject {
    var id: Int = 0
    var count: Int = 0
    var name: String = ""
    var currentPage = 1
    var total_Count = 0
    
    init(dict: [String: Any]) {
        super.init()
        id = dict["id"] as! Int
        count = dict["count"] as! Int
        name = dict["name"] as! String
        
    }
    lazy var users: [RecommendUser] = {
        let s = [RecommendUser]()
        return s
    }()
}
