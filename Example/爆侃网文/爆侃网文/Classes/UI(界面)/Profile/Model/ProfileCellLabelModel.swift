//
//  ProfileCellLabelModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ProfileCellLabelModel: ProfileCellModel {
    
    /// 显示文本
    var text: String?
    
    init(title: String, text: String) {
        self.text = text
        super.init(title: title)
    }
    
    init(title: String, icon: String, text: String) {
        self.text = text
        super.init(title: title, icon: icon)
    }


}
