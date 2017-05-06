//
//  ProfileCellModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ProfileCellModel: NSObject {
    
    typealias ProfileOperation = () -> ()
    
    var title: String?
    var subTitle: String?
    var icon: String?
    var operation: ProfileOperation?
    
    init(title: String) {
        self.title = title
        super.init()
    }
    
    init(title: String, icon: String) {
        self.title = title
        self.icon = icon
        super.init()
    }

}
