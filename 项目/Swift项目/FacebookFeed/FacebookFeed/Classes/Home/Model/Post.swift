//
//  Post.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class Post:SafeJsonObject{
    
    var name: String?
    var profileImageName: String?
    var statusText: String?
    var statusImageName: String?
    var numLikes: NSNumber?
    var numComments: NSNumber?
    var statusInageUrl: String?
    
    var location: Location?
    
    var infoKey: String?
    
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == location {
            location = Location()
            location?.setValuesForKeysWithDictionary(value as! [String: AnyObject])
        }else{
            super.setValue(value, forKey: key)
        }
    }
}

class SafeJsonObject: NSObject {
    override func setValue(value: AnyObject?, forKey key: String) {
        let selectorString = "set\(key.uppercaseString.characters.first!)\(String(key.characters.dropFirst())):"
        let selector = Selector(selectorString)
        if respondsToSelector(selector){
            super.setValue(value, forKey: key)
        }
    }
}

class Location: NSObject {
    var city: String?
    var state: String?
}

