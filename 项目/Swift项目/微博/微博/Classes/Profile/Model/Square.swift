//
//  Square.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON

class Square: NSObject {
    /**  图片  */
    var icon:String = ""
    /**  标题文字  */
    var name:String = ""
    /**  链接  */
    var url:String = ""
    
    init(dic: JSON) {
        self.icon = dic["icon"].stringValue
        self.name = dic["name"].stringValue
        self.url = dic["url"].stringValue
    }
    
    class func squares(array: [JSON]) -> NSArray {
        
        let arrayM = NSMutableArray()
        
        for item in array {
            arrayM.add(Square.init(dic: item))
        }
        
        return arrayM
    }

}
