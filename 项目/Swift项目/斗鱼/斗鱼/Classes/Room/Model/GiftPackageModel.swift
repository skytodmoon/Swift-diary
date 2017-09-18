//
//  GiftPackageModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class GiftPackageModel: BaseGameModel {
    var t: Int = 0
    var title: String = ""
    var list: [GiftModel] = [GiftModel]()
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "list" {
            guard let listArray = value as? [[String : Any]] else {
                return
            }
            
            for listDict in listArray {
                list.append(GiftModel(dict: listDict))
            }
        }else {
            super.setValue(value, forKey: key)
        }
        
    }

}
