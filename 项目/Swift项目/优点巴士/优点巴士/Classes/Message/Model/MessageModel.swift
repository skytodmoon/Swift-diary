//
//  MessageModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MessageModel: NSObject {
    
    var id: String!
    var createDate: String!
    var modifyDate: String!
    var url: String!
    var imgUrl: String!
    var overTime: String!
    var startTime: String!
    var status: String!
    var title: String!
    var content: String!
    var type: String!
    var isRead: String!
    var lineLabel: String!
    var function: String!
    var needEncrypt: String!
    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}


