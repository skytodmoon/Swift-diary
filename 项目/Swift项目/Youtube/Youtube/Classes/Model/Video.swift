//
//  Video.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumnailImageName: String?
    var title: String?
    var numberOfViews:NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject{
    var name: String?
    var profileImageName: String?
}
