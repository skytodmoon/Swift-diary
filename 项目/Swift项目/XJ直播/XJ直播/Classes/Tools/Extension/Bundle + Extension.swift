//
//  Bundle + Extension.swift
//  命名空间和反射机制
//
//  Created by 金亮齐 on 2017/12/25.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import Foundation

extension Bundle {
        
    // 计算型属性  没有参数,有返回值
    var nameSpace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
