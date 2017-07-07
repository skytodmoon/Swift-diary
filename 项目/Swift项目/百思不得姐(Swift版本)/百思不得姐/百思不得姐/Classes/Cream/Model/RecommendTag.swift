//
//  RecommendTag.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import SwiftyJSON

class RecommendTag: NSObject {
    
    /**  图片  */
    var image_list = ""
    /**  名字  */
    var theme_name = ""
    /**  订阅数  */
    var sub_number:NSNumber?
    
    init(dic:JSON){
        super.init()
        self.image_list = dic["image_list"].stringValue
        self.theme_name = dic["theme_name"].stringValue
        self.sub_number = dic["sub_number"].numberValue
        
    }
    
    class func tags(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        
        for item in array{
            arrayM.addObject(RecommendTag.init(dic: item))
        }
        
        return arrayM
    }
}