//
//  CreamTool.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class CreamTool: NSObject {
    
    /** 获得推荐标签 */
    class func getCategory(parameters:[String: AnyObject]? = nil,failBlock:((obj:AnyObject)->())? = nil,successfulBlock:((obj:AnyObject)->())) {
        
        /*请求参数*/
        var params = [String:String]()
        params["a"] = "tag_recommend";
        params["c"] = "topic";
        params["action"] = "sub";
        
        HTTPTool.getData("http://api.budejie.com/api/api_open.php", parameters: params,failBlock: { (obj) -> Void in
            print("请求失败")
        }) { (obj) -> Void in
            successfulBlock(obj:RecommendTag.tags(obj.array!)  as AnyObject)
            print("请求成功")
        }
    }
    
    /** 获得段子里的内容 */
    class func getTopics
        (parameters:[String:AnyObject]?,
         successfulBlock:(obj:AnyObject)->()){
        
        HTTPTool.getData("http://api.budejie.com/api/api_open.php",parameters:parameters, failBlock: { (obj) -> Void in
            
        }) { (obj) -> Void in
            
            successfulBlock(obj:[Topic.topics(obj["list"].array!),obj["info"]["maxtime"].stringValue])
        }
    }
    
    
    class func getComments
        (parameters:[String:AnyObject]?,
         successfulBlock:(obj:AnyObject)->()){
        HTTPTool.getData("http://api.budejie.com/api/api_open.php",parameters:parameters, failBlock: { (obj) -> Void in
        }) { (obj) -> Void in
            if obj == []{
                successfulBlock(obj: [[],[],0])
                return
            }
            successfulBlock(obj:[Comment.comments(obj["hot"].array!),Comment.comments(obj["data"].array!),obj["total"].intValue])
        }
        
    }
    

}
