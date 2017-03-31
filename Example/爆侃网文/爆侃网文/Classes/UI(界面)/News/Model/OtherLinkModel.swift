//
//  OtherLinkModel.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class OtherLinkModel: NSObject {
    
    var titlepicurl: String?
    
    var id: String?
    
    var classid: String?
    
    var diggdown: String?
    
    var plnum: String?
    
    var titlepic: String?
    
    var smalltext: String?
    
    var newstime: String?
    
    var onclick: String?
    
    var diggtop: String?
    
    var title: String?
    
    var titleurl: String?
    
    var classname: String?
    
    var classurl: String?
    
    var username: String?
    
    var notimg: String?
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}

}
