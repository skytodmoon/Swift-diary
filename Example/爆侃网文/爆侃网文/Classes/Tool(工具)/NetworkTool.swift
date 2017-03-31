//
//  NetworkTool.swift
//  爆侃网文
//
//  Created by 金亮齐 on 2017/3/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkTool: NSObject {
    
    /// 网络请求回调闭包 success:是否成功  flag:预留参数  result:字典数据 error:错误信息
    typealias NetworkFinished = (success: Bool, result: JSON?, error: NSError?) -> ()
    
    /// 网络工具类单例
    static let shareNetworkTool = NetworkTool()
}

// MARK: - 各种网络请求
extension NetworkTool {
    
    /**
     GET请求
     
     - parameter URLString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func get(APIString: String, parameters: [String : AnyObject]?, finished: NetworkFinished) {
        
        var urlString = ""
        if APIString.hasPrefix("http") {
            urlString = APIString
        } else {
            urlString = "\(API_URL)\(APIString)"
        }
        Alamofire.request(.GET, urlString, parameters: parameters).responseJSON { (response) -> Void in
            
            if let data = response.data {
                let json = JSON(data: data)
                if json["err_msg"].string == "success" {
                    finished(success: true, result: json, error: nil)
                } else {
                    finished(success: false, result: json, error: response.result.error)
                }
            } else {
                finished(success: false, result: nil, error: response.result.error)
            }
        }
        
    }
    
    /**
     POST请求
     
     - parameter URLString:  urlString
     - parameter parameters: 参数
     - parameter finished:   完成回调
     */
    func post(APIString: String, parameters: [String : AnyObject]?, finished: NetworkFinished) {
        
        var urlString = ""
        if APIString.hasPrefix("http") {
            urlString = APIString
        } else {
            urlString = "\(API_URL)\(APIString)"
        }
        Alamofire.request(.POST, urlString, parameters: parameters).responseJSON { (response) -> Void in
            
            if let data = response.data {
                let json = JSON(data: data)
                if json["err_msg"].string == "success" {
                    finished(success: true, result: json, error: nil)
                } else {
                    finished(success: false, result: json, error: response.result.error)
                }
            } else {
                finished(success: false, result: nil, error: response.result.error)
            }
        }
        
    }
}

