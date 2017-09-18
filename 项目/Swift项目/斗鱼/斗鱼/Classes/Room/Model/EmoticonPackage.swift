//
//  EmoticonPackage.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

// MARK: 从本地加载的是哪个 Plist 文件
class EmoticonPackage {
    
    // MARK: 定义一个数组,用来保存所有的模型
    lazy var emoticons : [EmoticonModel] = [EmoticonModel]()
    
    init(plistName: String) {
        
        guard let path = Bundle.main.path(forResource: plistName, ofType: nil),
            let emoticonArray = NSArray(contentsOfFile: path) as? [String]
            else {
                return
        }
        
        for str in emoticonArray {
            emoticons.append(EmoticonModel(emoticonName: str))
        }
    }
}
