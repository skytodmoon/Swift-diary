//
//  Post.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class Post:SafeJsonObject{
=======
class Post{
>>>>>>> parent of 6f466b2a... 解析json
    
    var name: String?
    var statusText: String?
    var profileImageName: String?
    var statusImageName: String?
    var numLikes: Int?
    var numContent: Int?
    var statusInageUrl: String?
<<<<<<< HEAD
    
    var location: Location?
        
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "location"{
            location = Location()
            location?.setValuesForKeysWithDictionary(value as! [String: AnyObject])
        }else{
            super.setValue(value, forKey: key)
        }
    }
}

class SafeJsonObject: NSObject {
    
    override func setValue(value: AnyObject?, forKey key: String) {
        let selectorString = "set\(key.uppercaseString.characters.first)\(String(key.characters.dropFirst())):"
        let selector = Selector(selectorString)
        if respondsToSelector(selector){
            super.setValue(value, forKey: key)
        }
    }
=======
>>>>>>> parent of 6f466b2a... 解析json
}


