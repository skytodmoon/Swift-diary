//
//  MallsGoods.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MallsGoods: NSObject {
    // 分类描述信息
    var fnDesc : String?
    // 分类id
    var fnId : String?
    // 分类的
    var fnName : String?
    // 商品列表
    var goodsList : [Goods]?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "childrenList" { // 取出商品列表
            let list = value as! [[String : AnyObject]]
            ALinLog(value)
            var goodses = [Goods]()
            for dict in list { // 遍历数组
                // 取出商品详情
                let pgoods = dict["pGoods"] as! [String:AnyObject]
                goodses.append(Goods(dict: pgoods))
            }
            goodsList = goodses
            return
        }
        super.setValue(value, forKey: key)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }

}
