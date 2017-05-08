//
//  UserAccount.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire

class UserAccount: NSObject {
    
    var access_token: String?
    var expires_in: NSNumber?{
        didSet{
            //过期时间
            expires_Date = NSDate(timeIntervalSinceNow: expires_in!.doubleValue)
        }
    }
    var expires_Date: NSDate?
    
    var uid: String?
    
    var avatar_large: String?
    
    var screen_name: String?
    
    override init() {
        
    }
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    /*
     https://api.weibo.com/2/users/show.json
     支持格式
     JSON
     HTTP请求方式
     GET
     是否需要登录
     是
     关于登录授权，参见 如何登录授权
     访问授权限制
     访问级别：普通接口
     频次限制：是
     关于频次限制，参见 接口访问权限说明
     请求参数
     必选	类型及范围	说明
     access_token	true	string	采用OAuth授权方式为必填参数，OAuth授权后获得。
     uid	false	int64	需要查询的用户ID。
     screen_name	false	string	需要查询的用户昵称。
     */
    
    //MARK: - 请求用户授权接口
    func loadUserInfo(finished: (account: UserAccount?, error: NSError?)->()){
        
        let params = ["access_token":access_token!, "uid":uid!]
        Alamofire.request(.GET, "https://api.weibo.com/2/users/show.json", parameters:params, encoding: .URLEncodedInURL, headers: nil).responseJSON{(Response) -> Void in
            
            if let dic = Response.result.value as? [String: AnyObject]{
                self.screen_name = dic["screen_name"] as? String
                self.avatar_large = dic["avatar_large"] as? String
                finished(account: self, error: nil)
                print("请求用户授权接口成功")
                print(Response)
                return
                    } else {
                finished(account: nil, error: Response.result.error)
                }
            }
                finished(account: nil, error: nil)
    }
    
    

    //MARK: - 登录用户
    class func userLogin() -> Bool {
        return UserAccount.loadAccount() != nil
    }
    
    //MARK: - 生产plist文件保存至沙盒
    static let filePath = "account.plist".cacheDir()
    func saveAccount() {
        NSKeyedArchiver.archiveRootObject(self, toFile: UserAccount.filePath)
    }
    //MARK: - 对日期进行处理，是否过期
    static var account: UserAccount?
    class func loadAccount() -> UserAccount? {
        if account != nil{
            return account
        }
        account = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? UserAccount
        
        if account?.expires_Date?.compare(NSDate())  == NSComparisonResult.OrderedAscending{
            //MARK: - 过期
            return nil
        }
        return account
    }
    //MARK: - 归档
    func encodeWithCoder(aCoder: NSCoder){
        
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeObject(expires_in, forKey: "expires_in")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(expires_Date, forKey: "expires_Date")
        aCoder.encodeObject(screen_name, forKey: "screen_name")
        aCoder.encodeObject(avatar_large, forKey: "avatar_large")
    }
    
    //MARK: - 解档
    required init?(coder aDecoder: NSCoder){
        
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeObjectForKey("expires_in") as? NSNumber
        uid = aDecoder.decodeObjectForKey("uid") as? String
        expires_Date = aDecoder.decodeObjectForKey("expires_Date") as? NSDate
        screen_name = aDecoder.decodeObjectForKey("screen_name")  as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large")  as? String

    }
}

