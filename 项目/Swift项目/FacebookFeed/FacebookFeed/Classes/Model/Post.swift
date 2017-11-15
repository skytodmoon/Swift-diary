//
//  Post.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class Post:NSObject{
    
    var name: String?
    var profileImageName: String?
    var statusText: String?
    var statusImageName: String?
    var numLikes: NSNumber?
    var numComments: NSNumber?
    var statusInageUrl: String?
    
    var location: Location?
}

class Location: NSObject {
    var city: String?
    var state: String?
}

