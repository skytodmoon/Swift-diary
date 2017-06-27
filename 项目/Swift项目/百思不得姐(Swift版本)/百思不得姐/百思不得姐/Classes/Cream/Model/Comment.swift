//
//  Comment.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON

class Comment: NSObject {
    
    /**  id  */
    var id = ""
    /**  音频文件的时长  */
    var voicetime = 0
    /**  音频文件的路径  */
    var voiceuri:String = ""
    /**  评论的文字内容  */
    var content = ""
    /**  被点赞的数量  */
    var like_count = 0
    /**  用户  */
    var user:QJLUser?
    /**  行高  */
    var cellHeight:CGFloat = 0
    
    init(dic:JSON){
        super.init()
        self.id = dic["id"].stringValue
        self.voicetime = dic["voicetime"].intValue
        self.voiceuri = dic["voiceuri"].stringValue
        self.content = dic["content"].stringValue
        self.like_count = dic["like_count"].intValue
        self.user = QJLUser.init(dic: dic["user"])
        
        let topic = self.content as NSString
        let maxSize = CGSizeMake(UIScreen.mainScreen().bounds.width - 105,CGFloat(MAXFLOAT))
        let textH = topic.boundingRectWithSize(maxSize, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFontOfSize(17)], context: nil).size.height
        // 只有文字时的高度
        self.cellHeight = CGFloat(50) + textH
        
        if !self.voiceuri.isEmpty{
            self.cellHeight = 74
        }
        
        
        
    }
    
    class func comments(array:[JSON]) -> NSMutableArray{
        
        let arrayM = NSMutableArray()
        
        for item in array{
            arrayM.addObject(Comment.init(dic: item))
        }
        
        return arrayM
    }
    
}