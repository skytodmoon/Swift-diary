//
//  MeAllLineViewModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MeAllLineViewModel {
    lazy var meAllLineModel : [MeAllLineModel] = [MeAllLineModel]()
}


extension MeAllLineViewModel {
    
    func loadmeAllLineData(_ finishedCallback: @escaping () -> ()) {
        
        let indexpage = 10
        
        Alamofire.request("http://www.youdianbus.cn/ydbus-api/api/line/list_running_line?", method: .get, parameters: ["index" : indexpage,"line_label" : "","line_type" : "","query_name" : "","size" : "10"]).responseJSON { (response) in
            
            if let value = response.result.value {
                let dict = JSON(value)
                let dataDict = dict["data"].dictionary
                if let lineList = dataDict!["lineList"]?.arrayObject{
                    for dict in lineList {
                        print(lineList)
                        self.meAllLineModel.append(MeAllLineModel(dict: dict as! [String : Any]))
                    }
                }
                
                finishedCallback()
            }
            
        }
    }
}
