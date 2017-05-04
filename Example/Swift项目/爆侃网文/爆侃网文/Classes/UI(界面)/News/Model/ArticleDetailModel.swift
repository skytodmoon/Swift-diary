//
//  ArticleDetailModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ArticleDetailModel: NSObject {
    
    /// 文章标题
    var title: String?
    
    /// 用户名
    var username: String?
    
    /// 最后编辑时间戳
    var lastdotime: String?
    
    /// 文章内容
    var newstext: String?
    
    /// 文章url
    var titleurl: String?
    
    /// 文章id
    var id: String?
    
    /// 当前子分类id
    var classid: String?
    
    /// 评论数量
    var plnum: String?
    
    /// 是否收藏
    var havefava: String?
    
    /// 文章简介
    var smalltext: String?
    
    /// 标题图片
    var titlepic: String?
    
    /// 赞数量
    var isgood: Int = 0
    
    /// 信息来源
    var befrom: String?
    
    /// 是否赞过
    var isStar = false
    
    /** 字典转模型构造方法 */
    init(dict: [String : String]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}

}
