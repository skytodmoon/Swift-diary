//
//  TransitModelView.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MJExtension

class TransitModelView{
    
    lazy var station_name = [String]()
    lazy var station_direction = [String]()
    lazy var distance = [Int]()
    lazy var transitModel : [TransitModel] = [TransitModel]()
}


extension TransitModelView {
    
    func loadtransitData(_ finishedCallback: @escaping () -> ()) {
        
        NetworkTools.requestData(.get, URLString: "http://www.youdianbus.cn/ydbus-busservice/api/station/list_station_by_location?coordinates_kind=bd&cur_lat=22.54821532562715&cur_lng=113.9555697298136&user=tbus", finishedCallback: { (result : Any) in
            
                let dict = JSON(result)
                let dataDict = dict["data"].dictionary
                if let near_station_list = dataDict!["near_station_list"]?.arrayObject{
                    
                        var station_nameM = [String]()
                        var station_directionM = [String]()
                        var distanceM = [Int]()
    
                        for dict in near_station_list {
                            self.transitModel.append(TransitModel(dict: dict as! [String : Any]))
                        }
                    
                        for i in 0..<self.transitModel.count{
                            let model = TransitModel.mj_object(withKeyValues: self.transitModel[i])
                            station_nameM.append((model?.station_name)!)
                            station_directionM.append((model?.station_direction)!)
                            distanceM.append((model?.distance)!)
                        }
                            
                        self.station_name = station_nameM
                        self.station_direction = station_directionM
                        self.distance = distanceM
                }
    
            finishedCallback()
        })
    }
}
