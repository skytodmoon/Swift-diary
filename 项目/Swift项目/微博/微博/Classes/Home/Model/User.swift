//
//  User.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


class User: NSObject {
    
    //MARK: - 用户ID
    var id: Int = 0
    //MARK: - 昵称
    var name: String?
    //MARK: - 用户头像url
    var pofile_imgae_ulr: String?{
        didSet{
            if let urlStr = pofile_imgae_ulr{
                imageURL = NSURL(string: urlStr)
            }
        }
    }
    var imageURL: NSURL?
    //MARK: 是否认证，true是，false不是
    var verified: Bool = false
    //MARK: 认证类型: --1:没有认证，0:认证用户，2,3,5: 企业认证，220: 达人
    var verified_type: Int = -1 {
        didSet{
            switch verified_type {
            case 0:
                verifiedImage = UIImage(named: "avatar_vip")
            case 2,3,5:
                verifiedImage = UIImage(named: "avatar_enterprise_vip")
            case 220:
                verifiedImage = UIImage(named: "avatar_grassroot")
            default:
                verifiedImage = nil
            }
        }
    }
    //MARK: - 认证图片
    var verifiedImage: UIImage?
    
    //MARK: - 会员等级
    var mbrank: Int = 0{
        didSet{
            if mbrank > 0 && mbrank < 7{
                mbrankImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            }
        }
    }
    
    var mbrankImage: UIImage?
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        
    }
    
    var properties = ["id", "name", "profile_image_url", "verified", "verified_type"]
    override var description: String {
        let dict = dictionaryWithValuesForKeys(properties)
        return "\(dict)"
    }
}
