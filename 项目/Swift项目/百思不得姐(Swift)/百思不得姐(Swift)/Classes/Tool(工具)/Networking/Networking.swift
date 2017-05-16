//
//  Networking.swift
//  百思不得姐(Swift)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class Networking: NSObject {

    
    class func getResponseData(_ url:String, parameters:[String:AnyObject]? = nil, success:@escaping(_ result:JSON)-> Void, error:@escaping (_ error:NSError)->Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        Alamofire.request(url, parameters: parameters).responseJSON { (response) in
            if let jsonData = response.result.value {
                success(JSON(jsonData))
            } else if let er = response.result.error {
                error(er as NSError)
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
    }
}
