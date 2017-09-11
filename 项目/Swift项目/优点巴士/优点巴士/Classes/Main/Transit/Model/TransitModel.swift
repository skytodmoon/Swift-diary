//
//  TransitModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TransitModel: NSObject {
    
    var distance : Int!
    var lat : Float!
    var lng : Float!
    var stationDirection : String!
    var stationId : String!
    var stationName : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        distance = dictionary["distance"] as? Int
        lat = dictionary["lat"] as? Float
        lng = dictionary["lng"] as? Float
        stationDirection = dictionary["station_direction"] as? String
        stationId = dictionary["station_id"] as? String
        stationName = dictionary["station_name"] as? String
    }

    override init() {
        
    }
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
}
