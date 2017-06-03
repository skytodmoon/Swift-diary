//
//  GroupItem.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/6/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class GroupItem: NSObject {
    /** 记录下组头部标题 */
    var headerTitle:String = ""
    
    /**  记录下组尾部标题 */
    var footerTitle:String = ""
    
    // 记录下当前组有多少行
    // items:XMGSettingItem
    // 行模型数组
    var items:[SettingItem]?
}
