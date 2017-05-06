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
    
    //MARK: - 请求用户授权接口
    func loadUserInfo(finished: (account: UserAccount?, error: NSError?)->()){
        
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
    
    }
    
    //MARK: - 解档
    required init?(coder aDecoder: NSCoder){
        
    }
}

