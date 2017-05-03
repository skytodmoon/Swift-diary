//
//  ADS.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ADS: NSObject {
    
    // 广告号
    var fnAid : String?
    // 内容
    var fnContent : String?
    // 商品ID号
    var fnId : String?
    // 展示的图片地址
    var fnImageUrl : String?
    // 订单数
    var fnOrder : Int64 = 0
    // 商品名
    var fnTitle : String?
    // 商品类型
    var fnType : Int = 0
    // 商品的h5地址(只剩"df277edb-a0c6-43fb-919a-cf2a9ac7e952", 需要自己拼接)
    var fnUrl : String?
    
    
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }

}
