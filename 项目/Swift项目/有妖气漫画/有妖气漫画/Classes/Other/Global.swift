//
//  Global.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/11.
//  Copyright © 2017年 金亮齐. All rights reserved.
//
import UIKit
import Kingfisher
import MJRefresh
import SnapKit

extension UIColor {
    class var background: UIColor {
        return UIColor(r: 242, g: 242, b: 242)
    }
    
    class var theme: UIColor {
        return UIColor(r: 29, g: 221, b: 43)
    }
}

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

extension String {
    static let searchHistoryKey = "searchHistoryKey"
    static let sexTypeKey = "sexTypeKey"
}
