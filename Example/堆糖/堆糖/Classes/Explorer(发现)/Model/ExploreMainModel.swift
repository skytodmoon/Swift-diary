//
//  ExploreMainModel.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON

class ExploreMainModel: NSObject {
    
    var group_id: String!
    var content_type: String!
    var group_name: String!
    var group_items: [Group_item]!
    
    class func loadExploreMainModels(data:NSData) -> [ExploreMainModel] {
        
        let json = JSON(data: data)
        var exploreMainModels = [ExploreMainModel]()
        
        for(_,subJson):(String,JSON) in json ["data"]{
            let exploreMainMolde = ExploreMainModel()
            exploreMainMolde.group_id = subJson["group_id"].stringValue
            exploreMainMolde.content_type = subJson["content_type"].stringValue
            exploreMainMolde.group_name = subJson["group_name"].stringValue
            exploreMainMolde.group_items = [Group_item]()
            
            for(_,subJson):(String,JSON) in subJson["group_items"]{
                let group_item = Group_item()
                group_item.name = subJson["name"].stringValue
                group_item.icon_url = subJson["icon_url"].stringValue
                group_item.target = subJson["target"].stringValue
                exploreMainMolde.group_items.append(group_item)
            }
            exploreMainModels.append(exploreMainMolde)
        }
        return exploreMainModels
    }
}


class Group_item: NSObject {
    var name: String!
    var icon_url: String!
    var target:String!
}