//
//  AttentionTool.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import PKHUD

class AttentionTool: NSObject {
    
    /* 获得左侧的标签列表 */
    class func getCategory(successfulBlock:@escaping ((_ obj:AnyObject)->())){
        
        /*请求参数*/
        var params = [String:String]()
        params["a"] = "category";
        params["c"] = "subscribe";
        
        Alamofire.request("http://api.budejie.com/api/api_open.php", method: .get, parameters: params).responseJSON { (response) in
            HUD.flash(.success, delay: 2.0)
            if let value = response.result.value {
                let dict = JSON(value)
                    successfulBlock(CategoryModel.categorys(array: dict["list"].array!) as AnyObject)
            }
        }
    }
}
