//
//  ClubHotModel.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON

private let comment_countWidth : CGFloat = 25.0
private let avatarWidth : CGFloat = 100.0

class ClubHotModel: NSObject {
    
    var id :Int!
    var path: String!
    var comment_count:Int!
    var visit_count:Int!
    var content:String!
    var avatar:String!
    var name:String!
    var username:String!
    var active_time:Int!
    var add_datetime_ts:Int!


    
    // 最终cell的高度
    var modelHeight:CGFloat!{
        var finalHeight: CGFloat = kCommenMargin
        // 1.计算文章高度
        let contentWidth = kMainScreenW - comment_countWidth - 5 * kCommenMargin
        let contentHeight = content!.getTextRectSize(UIFont.systemFontOfSize(10), size: CGSize(width: contentWidth, height: 300)).height
        finalHeight += contentHeight + kCommenMargin
        // 2.计算图片高度
        if path.isEmpty {
            finalHeight +=  kCommenMargin
        }else{
            finalHeight += avatarWidth + kCommenMargin
        }
        // 3.计算用户信息高度
        let userInfoHeight =  name!.getTextRectSize(UIFont.systemFontOfSize(9), size: CGSize(width: contentWidth, height: 200)).height
        finalHeight += kCommenMargin + userInfoHeight
        return finalHeight
    }
    

    
    class func loadCulbHotModels(data:NSData) -> [ClubHotModel] {
        
        let json = JSON(data: data)
        var clubHotModels = [ClubHotModel]()
        
        for(_,subJson):(String,JSON) in json ["data"]["object_list"]{
            let clubHotModel = ClubHotModel()
            
            clubHotModel.id = subJson["id"].intValue
            clubHotModel.path = subJson["photos"][0]["path"].stringValue
            clubHotModel.comment_count = subJson["comment_count"].intValue
            clubHotModel.visit_count = subJson["visit_count"].intValue
            clubHotModel.active_time = subJson["active_time"].intValue
            clubHotModel.add_datetime_ts = subJson["add_datetime_ts"].intValue
            clubHotModel.name = subJson["club"]["name"].stringValue
            clubHotModel.content = subJson["content"].stringValue
            clubHotModel.avatar = subJson["sender"]["avatar"].stringValue
            clubHotModel.username = subJson["sender"]["username"].stringValue
            
            clubHotModels.append(clubHotModel)
        }
        return clubHotModels
    }
}



