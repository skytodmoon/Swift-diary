//
//  MeTripModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MeTripModel: NSObject {
    
    var arriveTime : String!
    var busNo : String!
    var busType : String!
    var comfortLevel : Int!
    var content : String!
    var driver : String!
    var endStation : String!
    var evaluationTime : String!
    var lineId : String!
    var lineLabel : String!
    var lineLabelColor : String!
    var lineMode : String!
    var lineName : String!
    var lineNo : String!
    var linePlanEvaluationId : String!
    var linePlanId : String!
    var lineType : String!
    var mileage : Int!
    var planDate : String!
    var runTime : Int!
    var serviceLevel : Int!
    var startStation : String!
    var startTime : String!
    var status : String!
    var timeLevel : Int!
    var userId : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        arriveTime = dictionary["arriveTime"] as? String
        busNo = dictionary["busNo"] as? String
        busType = dictionary["busType"] as? String
        comfortLevel = dictionary["comfortLevel"] as? Int
        content = dictionary["content"] as? String
        driver = dictionary["driver"] as? String
        endStation = dictionary["endStation"] as? String
        evaluationTime = dictionary["evaluationTime"] as? String
        lineId = dictionary["lineId"] as? String
        lineLabel = dictionary["lineLabel"] as? String
        lineLabelColor = dictionary["lineLabelColor"] as? String
        lineMode = dictionary["lineMode"] as? String
        lineName = dictionary["lineName"] as? String
        lineNo = dictionary["lineNo"] as? String
        linePlanEvaluationId = dictionary["linePlanEvaluationId"] as? String
        linePlanId = dictionary["linePlanId"] as? String
        lineType = dictionary["lineType"] as? String
        mileage = dictionary["mileage"] as? Int
        planDate = dictionary["planDate"] as? String
        runTime = dictionary["runTime"] as? Int
        serviceLevel = dictionary["serviceLevel"] as? Int
        startStation = dictionary["startStation"] as? String
        startTime = dictionary["startTime"] as? String
        status = dictionary["status"] as? String
        timeLevel = dictionary["timeLevel"] as? Int
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


