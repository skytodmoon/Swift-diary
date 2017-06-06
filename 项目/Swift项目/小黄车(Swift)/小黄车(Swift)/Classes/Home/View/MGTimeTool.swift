//
//  MGTimeTool.swift
//  小黄车(Swift)
//
//  Created by 金亮齐 on 2017/6/6.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MGTimeTool: NSObject {

    class func getFormatTimeWithTimeInterval(timeInterval: Double) -> String{
        
        let hour = Int(timeInterval /  (60*60))
        let sec = Int(timeInterval.truncatingRemainder(dividingBy: 60))
        let min = Int(timeInterval / 60)
        
        return String(format: "%02zd:%02zd:%02zd", arguments: [hour,min,sec])
    }
    
    class func getTimeIntervalWithFormatTime(format: String) -> Double{
        let minAsec = format.components(separatedBy: ":")
        let min = minAsec.first
        let sec = minAsec.last
        
        return Double(min!)! * 60 + Double(sec!)!
    }
}
