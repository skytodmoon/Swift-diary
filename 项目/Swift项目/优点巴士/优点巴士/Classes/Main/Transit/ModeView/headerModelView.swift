//
//  headerModelView.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MJExtension

class headerModelView {
        lazy var header : [headerModel] = [headerModel]()
}



extension headerModelView {
    
    func loadheaderData(_ finishedCallback: @escaping () -> ()) {
        
        NetworkTools.requestData(.get, URLString: "http://www.youdianbus.cn/ydbus-busservice/api/realtime/list_nearest_bus?user=tbus&wait_line_list=%5B%7B%22line_id%22%3A%2202360%22%2C%22direction%22%3A%2201%22%2C%22wait_station_id%22%3A%22XBUS_00006038%22%7D%2C%7B%22line_id%22%3A%2202360%22%2C%22direction%22%3A%2202%22%2C%22wait_station_id%22%3A%22XBUS_00006037%22%7D%2C%7B%22line_id%22%3A%2200725%22%2C%22direction%22%3A%2202%22%2C%22wait_station_id%22%3A%22XBUS_00007138%22%7D%5D", finishedCallback: { (result : Any) in
            
            let dict = JSON(result)
            let dataDict = dict["data"].dictionary
            if let result_list = dataDict!["result_list"]?.arrayObject{
                print(result_list)
            }
            
            finishedCallback()
        })
    }
}
