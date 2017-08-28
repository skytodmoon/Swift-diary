//
//  EmoticonViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class EmoticonViewModel {
    // 创建一个单列
    static let shareInstance : EmoticonViewModel = EmoticonViewModel()
    
    lazy var packages: [EmoticonPackage] = [EmoticonPackage]()
    
    
    init() {
        packages.append(EmoticonPackage(plistName: "QHNormalEmotionSort.plist"))
        packages.append(EmoticonPackage(plistName: "QHSohuGifSort.plist"))
    }
}
