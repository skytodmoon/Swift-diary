//
//  AttentionTool.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON

class AttentionTool: NSObject {
    
    /* 获得左侧的标签列表 */
    class func getCategory(successfulBlock:((obj:AnyObject)->())){
        
        /*请求参数*/
        var params = [String:String]()
        params["a"] = "category";
        params["c"] = "subscribe";
        
        HTTPTool.getData("http://api.budejie.com/api/api_open.php",parameters: params, failBlock: { (obj) -> Void in
            SVProgressHUD.showWithStatus("加载失败")
            }) { (obj) ->Void in
                successfulBlock(obj: CategoryModel.categorys(obj["list"].array!) as AnyObject)

        }
    }
    
    /* 获得左侧的标签列表 */
    class func getUsers(page:NSNumber,categoryId:NSNumber,successfulBlock:((obj:AnyObject)->())){
        
        HTTPTool.getData("http://api.budejie.com/api/api_open.php?a=list&c=subscribe&category_id=\(categoryId)", failBlock: { (obj) -> Void in
            
            
        }) { (obj) -> Void in
            successfulBlock(obj: User.users(obj["list"].array!) as AnyObject)
            
        }
    }
    
}
