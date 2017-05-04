//
//  UserCommentModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/4/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class UserCommentModel: NSObject {
    
    var title: String?
    
    var saytext: String?
    
    var saytime: String?
    
    var id: String?
    
    var classid: String?
    
    var tbname: String?
    
    var plid: String?
    
    var plstep: String?
    
    var plusername: String?
    
    var zcnum: String?
    
    var userpic: String?
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}


}
