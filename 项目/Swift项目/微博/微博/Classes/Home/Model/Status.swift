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
    var created_at: String?
        {
        didSet{
            let createdDate = NSDate.dateWithStr(created_at!)
            created_at = createdDate.descDate
        }
    }
    //MARK: -  微博ID
    var id: Int = 0
    //MARK: -  微博内容
    var text: String?
    //MARK: -  微博来源
    var source: String?
        {
        didSet{
            //MARK: - 截取字符串
            if let str = source
            {
                if str == ""
                {
                    return
                }
                
                //MARK: - 获取开始截取的位置
                let startLocation = (str as NSString).rangeOfString(">").location + 1
                //MARK: - 获取截取的长度
                let length = (str as NSString).rangeOfString("<", options: NSStringCompareOptions.BackwardsSearch).location - startLocation
                //MARK: - 截取字符串
                source = "来自:" + (str as NSString).substringWithRange(NSMakeRange(startLocation, length))
            }
        }
    }
    //MARK: -  配图数组
    var pic_urls: [[String: AnyObject]]?
        {
        didSet{
            storedPicURLS = [NSURL]()
            storedLargePicURLS = [NSURL]()
            for dict in pic_urls!
            {
                if let urlStr = dict["thumbnail_pic"]
                {
                    storedPicURLS?.append(NSURL(string: urlStr as! String)!)
                    
                    let largeURLStr = urlStr.stringByReplacingOccurrencesOfString("thumbnail", withString: "large")
                    storedLargePicURLS!.append(NSURL(string: largeURLStr)!)
                }
            }
        }
    }
    //MARK: -  配图的URL
    var storedPicURLS: [NSURL]?
    
    //MARK: -  配图的大图URL
    var storedLargePicURLS: [NSURL]?
    
    //MARK: -  用户信息
    var user: User?
    //MARK: -  转发微博
    var retweeted_status: Status?
    //MARK: -  配图的URL数组
    var pictureURLS:[NSURL]?
    {
        return retweeted_status != nil ? retweeted_status?.storedPicURLS : storedPicURLS
    }
    
    class func loadStatuses(since_id: Int,max_id:Int, finished: (models:[Status]?, error:NSError?)->()){
        var params = ["access_token": UserAccount.loadAccount()!.access_token!]
        
        if since_id > 0 {
            params["since_id"] = "\(since_id)"
        }
        
        if max_id > 0
        {
            params["max_id"] = "\(max_id - 1)"
        }
        
        Alamofire.request(.GET, "https://api.weibo.com/2/statuses/home_timeline.json", parameters:params, encoding: .URL, headers: nil).responseJSON { (
            Response
            ) -> Void in
            if (Response.result.value != nil){
                let resultDic = Response.result.value as! [String:AnyObject]
                
                let models = dictToModel(resultDic["statuses"] as! [[String: AnyObject]])
                cacheStatusImages(models, finished:finished )
                print("获取首页数据成功")
                print(Response)
            }
        }
        
    }
    //MARK: -  缓存配图
    class func cacheStatusImages(list: [Status], finished: (models:[Status]?, error:NSError?)->()) {
        
        let group = dispatch_group_create()
        
        for status in list
        {
            guard let _ = status.pictureURLS else
            {
                continue
            }
            
            for url in status.pictureURLS!
            {
                dispatch_group_enter(group)
                
                let downloader = KingfisherManager.sharedManager.downloader
                
                downloader.downloadImageWithURL(url, progressBlock: nil, completionHandler: { (image, error, imageURL, originalData) -> () in
                    if let image = image,imageURL = imageURL{
                        ImageCache.defaultCache.storeImage(image, forKey: imageURL.absoluteString)
                    }
                    
                    dispatch_group_leave(group)
                })
            }
        }
        
        dispatch_group_notify(group, dispatch_get_main_queue()) { () -> Void in
            finished(models: list, error: nil)
        }
    }
    
    class func dictToModel(list: [[String: AnyObject]]) -> [Status] {
        var models = [Status]()
        for dict in list
        {
            models.append(Status(dict: dict))
        }
        return models
    }
    
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        
        if "user" == key
        {
            user = User(dict: value as! [String : AnyObject])
            return
        }
        
        if "retweeted_status" == key
        {
            retweeted_status = Status(dict: value as! [String : AnyObject])
            return
        }
        
        super.setValue(value, forKey: key)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    var properties = ["created_at", "id", "text", "source", "pic_urls"]
    override var description: String {
        let dict = dictionaryWithValuesForKeys(properties)
        return "\(dict)"
    }
}
