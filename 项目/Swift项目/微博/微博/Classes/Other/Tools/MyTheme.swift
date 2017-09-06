//
//  MyTheme.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftTheme

enum MyTheme: Int {
    
    case day = 0
    
    case night = 1
    
    static var current = MyTheme.day
    static var before = MyTheme.day
    
    /// 选择主题
    static func switchTo(_ theme: MyTheme) {
        
        before = current
        current = theme
        
        switch theme {
        case .day: ThemeManager.setTheme(plistName: "default_theme", path: .mainBundle)
        case .night: ThemeManager.setTheme(plistName: "night_theme", path: .mainBundle)
        }
    }
    
    /// 选择了黑色主题
    static func switchNight(_ isToNight: Bool) {
        switchTo(isToNight ? .night : before)
    }
    
    static func isNight() -> Bool {
        return current == .night
    }
}

