//
//  NSDate+Extension.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import Foundation
extension NSDate{
    //获取当前时间的时间戳
    class func getCurrentTime() -> String {
        //获取当前时间
        let now = NSDate()
        //当前时间的时间戳
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let dateSt:Int = Int(timeInterval)
        return String(dateSt)

    }
}
