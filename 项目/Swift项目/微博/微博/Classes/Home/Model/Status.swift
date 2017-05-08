//
//  Status.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class Status: NSObject {
    
    //MARK: - 微博创建时间
    var created_at: String?{
        didSet{
            let createdDate = NSDate.dateWithStr(created_at!)
            created_at = createdDate.descDate
        }
    }
    //MARK: - 微博id
    var id: Int = 0
    //MARK: 微博内容
    var text: String?
    //MARK: 微博来源
    var source: String?{
        didSet{
            //MARK: - 截取字符串
            if let str = source{
                if str == ""{
                    return
                }
                //MARK: - 获取开始截取的位置
                let startLocation = (str as NSString).rangeOfString(">").location + 1
                //MARK: - 获取截取的长度
                let length = (str as NSString).rangeOfString("<",options: NSStringCompareOptions.BackwardsSearch).location - startLocation
                //MARK: 截取字符串
                source = "来自:" + (str as NSString).substringWithRange(NSMakeRange(startLocation, length))
            }
        }
    }
    //MARK: - 配图数组
    var pic_urls: [[String: AnyObject]]?{
        didSet{
            storedPicURLS = [NSURL]()
            storedLargePicURLS = [NSURL]()
            for dict in pic_urls!{
                if let urlStr = dict["thumbnail_pic"]{
                    let largeURLStr = urlStr.stringByReplacingOccurrencesOfString("thumbnail", withString: "large")
                    storedLargePicURLS!.append(NSURL(string: largeURLStr)!)
                }
            }
        }
    }
    
    //MARK: 配图的URL
    var storedPicURLS: [NSURL]?
    //MARK: 配图最大的URL
    var storedLargePicURLS: [NSURL]?
    //MARK: 用户信息
    var user: User?
    //MARK: 转发微博
    var reteeted_status: Status?
    //MARK: 配置URL数组
    var pictureURL:[NSURL]?{
        return reteeted_status != nil ? reteeted_status?.storedPicURLS : storedPicURLS
    }
}