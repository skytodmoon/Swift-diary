//
//  QJLUser.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import SwiftyJSON

class QJLUser: NSObject {
    /**  用户  */
    var username = ""
    /**  性别  */
    var sex = ""
    /**  头像 */
    var profile_image = ""
    
    init(dic:JSON){
        super.init()
        
        self.username = dic["username"].stringValue
        self.sex = dic["sex"].stringValue
        self.profile_image = dic["profile_image"].stringValue
        
    }
    
    class func users(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        
        for item in array{
            arrayM.addObject(QJLUser.init(dic: item))
        }
        
        return arrayM
    }
}
