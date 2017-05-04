//
//  CollectionModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class CollectionModel: NSObject {
    
    /// 文章标题
    var title: String?
    
    /// 文章分类id
    var classid: String?
    
    /// 文章id
    var id: String?
    
    /// 表名
    var tbname: String?
    
    /// 收藏时间
    var favatime: String?
    
    /// 收藏id
    var favaid: String?
    
    /// 收藏夹分类id
    var cid: String?
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}


}
