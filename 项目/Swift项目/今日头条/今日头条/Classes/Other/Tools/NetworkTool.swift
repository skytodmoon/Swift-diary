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
    /// 我的关注
    static func loadMyFollow(completionHandler: @escaping (_ concerns: [MyConcern])->())
    /// 关注详情
    static func loadOneFollowDetail(userId: Int, completionHandler: @escaping (_ follewDetail: FollowDetail)->())
}

class NetworkTool: NetworkToolProtocol {
    // --------------------------------- 我的 mine  ---------------------------------
    /// 我的界面 cell 数据
    class func loadMineCellData(completionHandler: @escaping (_ sectionsArray: [AnyObject])->()) {
        let url = BASE_URL + "user/tab/tabs/?"
        let params = ["iid": IID]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            print(url)
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"].string == "success" else {
                    return
                }
                if let data = json["data"].dictionary {
                    if let sections = data["sections"]?.arrayObject {
                        var sectionArray = [AnyObject]()
                        for section in sections {
                            var rows = [MineCellModel]()
                            for row in section as! [AnyObject] {
                                let mineCell = MineCellModel(dict: row as! [String : AnyObject])
                                rows.append(mineCell)
                            }
                            sectionArray.append(rows as AnyObject)
                        }
                        completionHandler(sectionArray)
                    }
                }
            }
        }
    }
    
    /// 我的关注
    class func loadMyFollow(completionHandler: @escaping (_ concerns: [MyConcern])->()) {
        let url = BASE_URL + "concern/v2/follow/my_follow/?"
        let params = ["device_id": device_id]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"].string == "success" else {
                    return
                }
                if let datas = json["data"].arrayObject {
                    var concerns = [MyConcern]()
                    for data in datas {
                        let myConcern = MyConcern(dict: data as! [String: AnyObject])
                        concerns.append(myConcern)
                    }
                    
                    completionHandler(concerns)
                }
            }
        }
    }
    
    /// 关注详情
    class func loadOneFollowDetail(userId: Int, completionHandler: @escaping (_ follewDetail: FollowDetail)->()) {
        let url = BASE_URL + "user/profile/homepage/v3/?"
        let params = ["user_id": userId] as [String : Any]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"].string == "success" else {
                    return
                }
                let followDetail = FollowDetail(dict: json["data"].dictionaryObject! as [String : AnyObject])
                completionHandler(followDetail)
            }
        }
    }
}

