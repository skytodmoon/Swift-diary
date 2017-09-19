//
//  TransitHeaderModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TransitHeaderModel: NSObject {
    var direction : String!
    var end_station : String!
    var lineId : String!
    var line_name : String!
    var msg : String!
    var nearestBusList : [AnyObject]!
    var status : String!
    var waitStationId : String!
    var waitStationName : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        direction = dictionary["direction"] as? String
        end_station = dictionary["end_station"] as? String
        lineId = dictionary["line_id"] as? String
        line_name = dictionary["line_name"] as? String
        msg = dictionary["msg"] as? String
        nearestBusList = dictionary["nearest_bus_list"] as? [AnyObject]
        status = dictionary["status"] as? String
        waitStationId = dictionary["wait_station_id"] as? String
        waitStationName = dictionary["wait_station_name"] as? String
    }
    
    override init() {
        
    }
    
    init(dict:[String: Any]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
