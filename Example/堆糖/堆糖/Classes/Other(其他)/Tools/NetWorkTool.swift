//
//  NetWorkTool.swift
//  堆糖
//
//  Created by 金亮齐 on 2017/4/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class NetWorkTool: NSObject {

    typealias SuccessfulBlock = (obj: JSON)->Void
    typealias FailBlock = (obj:NSError)->Void
    
    class func getData(urlStr: String, parameters: [String: AnyObject]? = nil, failBlock: FailBlock, successfulBlock: SuccessfulBlock){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        Alamofire.request(.GET, urlStr, parameters: parameters).responseJSON{ response in
        if let value = response.result.value {
            let json = JSON(value)
            successfulBlock(obj: json)
        }else if let error = response.result.error{
                failBlock(obj: error)
            }
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
}