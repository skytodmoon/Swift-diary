//
//  NetworkTool.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

protocol NetworkToolProtocol {
    // --------------------------------- 我的 mine  ---------------------------------
    /// 我的界面 cell 数据
    static func loadMineCellData(completionHandler: @escaping (_ sectionsArray: [AnyObject])->())
    
}

class NetworkTool: NetworkToolProtocol {
    static func loadMineCellData(completionHandler: @escaping ([AnyObject]) -> ()) {
        let url = BASE_URL + "user/tab/tabs/?"
        let params = ["iid": IID]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            print(url)
            print(response)
        }
    }
    

}
