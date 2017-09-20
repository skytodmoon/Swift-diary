//
//  CityModelView.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CityModelView {
    lazy var city : [CityModel] = [CityModel]()
}


extension CityModelView {
    
    func loadCityData(_ finishedCallback: @escaping () -> ()) {
        
        Alamofire.request("http://www.youdianbus.cn/ydbus-api/api/intercity/search_line_by_city?dev_id=D781FAF8-C667-4FBA-B2FE-49E9B21F28C4&token=a43acba1c90752f93e51f64364b71d9c&user_id=7c19f276d626928a611e0f58eeaddc09", method: .get, parameters: nil).responseJSON { (response) in
            
            if let value = response.result.value {
                let dict = JSON(value)
                let dataDict = dict["data"].dictionary
                if let lineIntercityList = dataDict!["lineIntercityList"]?.arrayObject {
                    print(lineIntercityList)
                    for dict in lineIntercityList {
                        self.city.append(CityModel(dict: dict as! [String : Any]))
                    }
                }
                finishedCallback()
            }
            
        }
    }
    
}
   
