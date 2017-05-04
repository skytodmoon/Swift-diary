//
//  PhotoDetailModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class PhotoDetailModel: NSObject {
    
    /// 图片标题
    var title: String?
    
    /// 图片描述
    var text: String?
    
    /// 图片url
    var picurl: String?
    
    /**
     字典转模型构造方法
     */
    init(dict: [String : String]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    


}
