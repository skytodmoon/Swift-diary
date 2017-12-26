//
//  String + Extension.swift
//  XJ直播
//
//  Created by 金亮齐 on 2017/12/25.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import Foundation

extension String {
    static var documentPath : String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    }
}
