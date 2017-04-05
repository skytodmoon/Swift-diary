//
//  ProfileCellArrowModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ProfileCellArrowModel: ProfileCellModel {
    
    /// 目标控制器
    var destinationVc: AnyClass?
    
    init(title: String, destinationVc: AnyClass) {
        self.destinationVc = destinationVc
        super.init(title: title)
    }
    
    override init(title: String) {
        super.init(title: title)
    }
    
    override init(title: String, icon: String) {
        super.init(title: title, icon: icon)
    }
    
    init(title: String, icon: String, destinationVc: AnyClass) {
        self.destinationVc = destinationVc
        super.init(title: title, icon: icon)
    }


}
