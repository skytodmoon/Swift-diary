//
//  ProfileCellSwitchModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ProfileCellSwitchModel: ProfileCellModel {
    
    /// 开关状态
    var on: Bool {
        return NSUserDefaults.standardUserDefaults().boolForKey(NIGHT_KEY)
    }

}
