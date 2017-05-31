//
//  NetworkTools.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTools {
    class func requestData(type : MethodType, URLString : String, parameters: [String : NSString]? = nil, finishedCallback : (result : AnyObject) -> ()) {
        
        let method = type == .GET ? Method.GET : Method.POST
        
        Alamofire.request(method, URLString, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error)
                return
            }
            finishedCallback(result: result)
        }
    }
}
