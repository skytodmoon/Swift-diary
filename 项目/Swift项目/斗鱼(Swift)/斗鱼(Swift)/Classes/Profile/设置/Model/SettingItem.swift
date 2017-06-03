//
//  SettingModel.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/6/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//
import UIKit

class SettingItem: NSObject {
    var title:String = ""
    var subTitle:String = ""
    var icon:String = ""
    
    // 保存每一行cell做的事情
    var operationBlock: ((_ indexPath: IndexPath) -> ())?
    
    init(title: String, subTitle: String = "", icon: String = "") {
        self.icon = icon
        self.title = title
        self.subTitle = subTitle
    }
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
