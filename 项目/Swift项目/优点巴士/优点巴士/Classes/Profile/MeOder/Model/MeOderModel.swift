//
//  MeOderModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeOderModel: NSObject {
    
    var date: String = ""
    
    var alterTicket : Bool!
    var arriveTime : String!
    var canUseSZT : Bool!
    var couponId : String!
    var createDate : String!
    var endCity : String!
    var endStationName : String!
    var hasRefundOrder : String!
    var id : String!
    var isAlterTicket : Bool!
    var isEnterpriseUser : Bool!
    var isOpenSZT : Bool!
    var isRefundTicket : Bool!
    var isSupportableSZT : Bool!
    var lineId : String!
    var lineLabel : String!
    var lineLabelColor : String!
    var lineMode : String!
    var lineNo : String!
    var lineType : String!
    var mileage : String!
    var orderItemList : [AnyObject]!
    var orderNo : String!
    var orderStatus : String!
    var paymentStatus : String!
    var paymentType : String!
    var phoneNum : String!
    var realPrice : String!
    var reasonType : String!
    var refundOrderList : [AnyObject]!
    var refundPrice : String!
    var refundTicket : Bool!
    var runTime : String!
    var startCity : String!
    var startStationName : String!
    var startTime : String!
    var totalPrice : String!
    var userId : String!
    
    
    init(fromDictionary dictionary: NSDictionary){
        

        
        alterTicket = dictionary["alterTicket"] as? Bool
        arriveTime = dictionary["arriveTime"] as? String
        canUseSZT = dictionary["canUseSZT"] as? Bool
        couponId = dictionary["couponId"] as? String
        createDate = dictionary["createDate"] as? String
        endCity = dictionary["endCity"] as? String
        endStationName = dictionary["endStationName"] as? String
        hasRefundOrder = dictionary["hasRefundOrder"] as? String
        id = dictionary["id"] as? String
        isAlterTicket = dictionary["isAlterTicket"] as? Bool
        isEnterpriseUser = dictionary["isEnterpriseUser"] as? Bool
        isOpenSZT = dictionary["isOpenSZT"] as? Bool
        isRefundTicket = dictionary["isRefundTicket"] as? Bool
        isSupportableSZT = dictionary["isSupportableSZT"] as? Bool
        lineId = dictionary["lineId"] as? String
        lineLabel = dictionary["lineLabel"] as? String
        lineLabelColor = dictionary["lineLabelColor"] as? String
        lineMode = dictionary["lineMode"] as? String
        lineNo = dictionary["lineNo"] as? String
        lineType = dictionary["lineType"] as? String
        mileage = dictionary["mileage"] as? String
        orderItemList = dictionary["orderItemList"] as? [AnyObject]
        orderNo = dictionary["orderNo"] as? String
        orderStatus = dictionary["orderStatus"] as? String
        paymentStatus = dictionary["paymentStatus"] as? String
        paymentType = dictionary["paymentType"] as? String
        phoneNum = dictionary["phoneNum"] as? String
        realPrice = dictionary["realPrice"] as? String
        reasonType = dictionary["reasonType"] as? String
        refundOrderList = dictionary["refundOrderList"] as? [AnyObject]
        refundPrice = dictionary["refundPrice"] as? String
        refundTicket = dictionary["refundTicket"] as? Bool
        runTime = dictionary["runTime"] as? String
        startCity = dictionary["startCity"] as? String
        startStationName = dictionary["startStationName"] as? String
        startTime = dictionary["startTime"] as? String
        totalPrice = dictionary["totalPrice"] as? String
        userId = dictionary["userId"] as? String
    }

    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
