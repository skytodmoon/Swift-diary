//
//  GiftModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class GiftModel: BaseGameModel {
    /// 图片
    var img2: String = ""
    
    /// 价格
    var coin: Int = 0
    
    /// 标题
    var subject: String = "" { // 标题
        didSet{
            if subject.contains("有声") {
                subject = subject.replacingOccurrences(of: "有声", with: "")
            }
        }
    }

}
