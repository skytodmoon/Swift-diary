//
//  Column.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ColumnModel: NSObject,NSCoding {
    
    var id: Int?
    var name: String = ""
    var slug: String = ""
    var first_letter: String    = ""
    var status: Int?
    var prompt: Int?
    var image: String = ""
    var thumb: String = ""
    var priority: Int?
    var screen: Int?
    
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
   
    // MARK:- 处理需要归档的字段
    func encode(with aCoder:NSCoder) {
        aCoder.encode(id, forKey:"id")
        aCoder.encode(name, forKey:"name")
        aCoder.encode(slug, forKey:"slug")
        aCoder.encode(first_letter, forKey:"first_letter")
        aCoder.encode(status, forKey:"status")
        aCoder.encode(prompt, forKey:"prompt")
        aCoder.encode(image, forKey:"image")
        aCoder.encode(thumb, forKey:"thumb")
        aCoder.encode(priority, forKey:"priority")
        aCoder.encode(screen, forKey:"screen")
    }
    
    // MARK:- 处理需要解档的字段
    required init(coder aDecoder:NSCoder) {
        super.init()
        
        id = aDecoder.decodeObject(forKey:"id")as? Int
        name = (aDecoder.decodeObject(forKey:"name")as? String)!
        slug = (aDecoder.decodeObject(forKey:"slug")as? String)!
        first_letter = (aDecoder.decodeObject(forKey:"first_letter")as? String)!
        status = aDecoder.decodeObject(forKey:"status")as? Int
        prompt = aDecoder.decodeObject(forKey:"prompt")as? Int
        image = (aDecoder.decodeObject(forKey:"image")as? String)!
        thumb = (aDecoder.decodeObject(forKey:"thumb")as? String)!
        priority = aDecoder.decodeObject(forKey:"priority")as? Int
        screen = aDecoder.decodeObject(forKey:"screen")as? Int
    }
    
    override init() {
        super.init()
    }
}
