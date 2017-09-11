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

class TransitModelView{
    lazy var transitModel : [TransitModel] = [TransitModel]()
}


extension TransitModelView {
    
    func loadtransitData(_ finishedCallback: @escaping () -> ()) {
        
        Alamofire.request("http://www.youdianbus.cn/ydbus-busservice/api/station/list_station_by_location?coordinates_kind=bd&cur_lat=22.54821532562715&cur_lng=113.9555697298136&user=tbus", method: .get, parameters: nil).responseJSON { (response) in
            
            if let value = response.result.value {
                let dict = JSON(value)
                let dataDict = dict["data"].dictionary
                if let near_station_list = dataDict!["near_station_list"]?.arrayObject{
                    for dict in near_station_list {
                        self.transitModel.append(TransitModel(dict: dict as! [String : Any]))
                    }
                }
                
                finishedCallback()
            }
            
        }
    }
}
