//
//  UserAccount.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class UserAccount: NSObject, NSCoding {
    
    // MARK:- 处理需要归档的字段
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(expires_Date, forKey: "expires_Date")
        aCoder.encode(screen_name, forKey: "screen_name")
        aCoder.encode(avatar_large, forKey: "avatar_large")
    }
    
    // MARK:- 处理需要解档的字段
    required init(coder aDecoder:NSCoder) {
        
        super.init()
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        expires_in = aDecoder.decodeObject(forKey: "expires_in") as? NSNumber
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        expires_Date = aDecoder.decodeObject(forKey: "expires_Date") as? NSDate
        screen_name = aDecoder.decodeObject(forKey: "screen_name")  as? String
        avatar_large = aDecoder.decodeObject(forKey: "avatar_large")  as? String
    }
    
    
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
    
    init(dict: [String: Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
    //MARK: - 请求用户授权接口
    func loadUserInfo(finished: @escaping (_ account: UserAccount?, _ error: NSError?)->()){
        let params = ["access_token":access_token!, "uid":uid!]
        Alamofire.request("https://api.weibo.com/2/users/show.json", method: .get, parameters: params).responseJSON { (response) in
            HUD.flash(.success, delay: 2.0)
            if let dic = response.result.value as? [String: AnyObject] {
                self.screen_name = dic["screen_name"] as? String
                self.avatar_large = dic["avatar_large"] as? String
                finished(self, nil)
                return
                }else{
                finished(nil, response.result.error as NSError?)
            }
        }
        finished(nil, nil)
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
        account = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? UserAccount
        
        if account?.expires_Date?.compare(NSDate() as Date)  == ComparisonResult.orderedAscending{
            //MARK: - 过期
            return nil
        }
        return account
    }
}
