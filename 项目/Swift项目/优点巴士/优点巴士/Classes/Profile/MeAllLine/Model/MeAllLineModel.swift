//
//  MeAllLineModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeAllLineModel: NSObject {
    
    var arriveTime : String!
    var dayPrice : String!
    var desc : String!
    var direction : String!
    var endStationId : String!
    var endStationName : String!
    var inventory : String!
    var isVoted : String!
    var lineId : String!
    var lineLabel : String!
    var lineLabelColor : String!
    var lineModel : String!
    var lineName : String!
    var lineNo : String!
    var lineType : String!
    var mileage : String!
    var monthlyPrice : String!
    var opType : String!
    var runTimes : String!
    var serviceEndTime : String!
    var serviceStartTime : String!
    var startStationId : String!
    var startStationName : String!
    var startTime : String!
    var votedCount : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        arriveTime = dictionary["arriveTime"] as? String
        dayPrice = dictionary["dayPrice"] as? String
        desc = dictionary["desc"] as? String
        direction = dictionary["direction"] as? String
        endStationId = dictionary["endStationId"] as? String
        endStationName = dictionary["endStationName"] as? String
        inventory = dictionary["inventory"] as? String
        isVoted = dictionary["isVoted"] as? String
        lineId = dictionary["lineId"] as? String
        lineLabel = dictionary["lineLabel"] as? String
        lineLabelColor = dictionary["lineLabelColor"] as? String
        lineModel = dictionary["lineModel"] as? String
        lineName = dictionary["lineName"] as? String
        lineNo = dictionary["lineNo"] as? String
        lineType = dictionary["lineType"] as? String
        mileage = dictionary["mileage"] as? String
        monthlyPrice = dictionary["monthlyPrice"] as? String
        opType = dictionary["opType"] as? String
        runTimes = dictionary["runTimes"] as? String
        serviceEndTime = dictionary["serviceEndTime"] as? String
        serviceStartTime = dictionary["serviceStartTime"] as? String
        startStationId = dictionary["startStationId"] as? String
        startStationName = dictionary["startStationName"] as? String
        startTime = dictionary["startTime"] as? String
        votedCount = dictionary["votedCount"] as? String
    }

    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
