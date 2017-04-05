//
//  ProfileCellGroupModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ProfileCellGroupModel: NSObject {
    
    var cells: [ProfileCellModel]?
    
    var headerTitle: String?
    
    var footerTitle: String?
    
    init(cells: [ProfileCellModel]) {
        self.cells = cells
        super.init()
    }

}
