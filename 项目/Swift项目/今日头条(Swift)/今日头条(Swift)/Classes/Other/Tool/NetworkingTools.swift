//
//  NetworkingTools.swift
//  今日头条(Swift)
//
//  Created by 金亮齐 on 2017/5/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import MJRefresh

class NetworkingTools: NSObject {

     // 单例
     static let shareNetworkTools = NetworkingTools()
    
    // 有多少文章的更新
    func loadArticleRefreshTip(finished:(count: Int)->()){
        let url = BASE_URL + "2/article/v39/refresh_tip/"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showErrorWithStatus("加载失败")
                return
            }
            if let value = response.result.value{
                let json = JSON(value)
                let data = json["data"].dictionary
                let count = json["count"].int
                finished(count: count!)
            }
        }
    }
}
