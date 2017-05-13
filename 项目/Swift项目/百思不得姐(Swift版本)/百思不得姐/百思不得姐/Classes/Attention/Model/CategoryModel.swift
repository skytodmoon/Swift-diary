//
//  CategoryModel.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON

class CategoryModel: NSObject {
    
    private(set) var a = 3
    //ID
    var id:NSNumber?
    //总数
    var count:NSNumber?
    //名字
    var name:String?
    /**  用户数据  */
    var users:[User] = []
    
    init(dic:JSON) {
        
        super.init()
        id = dic["id"].numberValue
        count = dic["count"].numberValue
        name = dic["name"].stringValue
    }
    
    class func categorys(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        for item in array{
            arrayM.addObject(CategoryModel.init(dic: item))
        }
        return arrayM
    }

}
