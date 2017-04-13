//
//  ClubClubModel.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON

class ClubClubModel: NSObject {

    var path : String!
    var name:String?
    var topic_unread :Int!
    
    override init() {
        super.init()
        path = ""
        name   = ""
        topic_unread = 0
    }
    
    class func loadClubClubModels(data:NSData) -> [ClubClubModel]{
        
        let json = JSON(data: data)
        var clubClubModels = [ClubClubModel]()
        for (_,subJson):(String, JSON) in json["data"]["object_list"]{
            let clubClubModel = ClubClubModel()
            clubClubModel.name = subJson["name"].stringValue
            clubClubModel.path = subJson["photo"]["path"].stringValue
            clubClubModel.topic_unread = subJson["topic_unread"].intValue
            clubClubModels.append(clubClubModel)
            
        }
        return clubClubModels
    }
}

