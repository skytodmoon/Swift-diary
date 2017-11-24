//
//  Video.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views:NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    var channel: Channel?
}

class Channel: NSObject{
    var name: String?
    var profileImageName: String?
}
