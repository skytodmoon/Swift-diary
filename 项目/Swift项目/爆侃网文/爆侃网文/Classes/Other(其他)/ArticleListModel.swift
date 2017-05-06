//
//  ArticleListModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ArticleListModel: NSObject {
    
    /// 作者昵称
    var username: String?
    
    /// 点击量
    var onclick: String?
    
    /// 发布时间
    var newstime: String?
    
    /// 创建文章时间戳
    var created_at: String?
    
    /// 文章id
    var id: String?
    
    /// 文章标题
    var title: String?
    
    /// 标题图片url
    var titlepic: String?
    
    /// 文章简介
    var smalltext: String?
    
    /// 数据表名
    var table: String?
    
    /// 父栏目id
    var bclassid: String?
    
    /// 当前栏目id
    var classid: String?
    
    /// 当前栏目名称
    var classname: String?
    
    /// 评论数量
    var plnum: String?
    
    /// 标题图片数量
    var piccount: Int = 0
    
    /// 多图数组 存储多张标题图片url的数组
    var morepic: [String]?
    
    /// 存储形变改变的偏移量
    var offsetY: CGFloat = 0
    
    /// 缓存行高
    var rowHeight: CGFloat = 0.0
    
    /**
     字典转模型构造方法
     */
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}

}
