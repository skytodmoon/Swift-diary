//
//  NetworkTool.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case GET
    case POST
}

class NetworkTool {
    class func request(type: MethodType, urlString: String, paramters: [String: Any]? = nil, finishedCallback: @escaping (_ result: Any) -> ()) {
        // 获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        // 发送网络请求
        Alamofire.request(urlString, method: method, parameters: paramters).responseJSON { (response) in
            guard let result = response.result.value else {
                return
            }
            // 回调
            finishedCallback(result as AnyObject)
        }
    }
}
