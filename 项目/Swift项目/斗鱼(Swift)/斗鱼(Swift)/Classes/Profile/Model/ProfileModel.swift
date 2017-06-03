//
//  ProfileModel.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ProfileModel: NSObject {
    // MARK:- 定义属性
    var title : String = ""
    var icon : String = ""
    var detailTitle: String = ""
    
    // MARK:- 自定义构造函数
    override init() {
        
    }
    
    init(icon: String, title: String, detailTitle: String = "") {
        self.icon = icon
        self.title = title
        if detailTitle != "" {
           self.detailTitle = detailTitle
        }
    }
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }

}
