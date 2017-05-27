//
//  Keyword.swift
//  今日头条(Swift)
//
//  Created by 金亮齐 on 2017/5/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class Keyword: NSObject {
    var keyword: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        keyword = dict["keyword"] as? String
    }
    
}
