//
//  ActivityDetailViewModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/9.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//



import UIKit
import Alamofire
import SwiftyJSON

class ActivityDetailViewModel {
    lazy var activityDetail : [ActivityDetailModel] = [ActivityDetailModel]()
}


extension ActivityDetailViewModel {
    
    func loadactivityDetailData(_ finishedCallback: @escaping () -> ()) {
        
        Alamofire.request("http://www.youdianbus.cn/ydbus-api/api/order/list_order_storage_item?date=2017-09&dev_id=D781FAF8-C667-4FBA-B2FE-49E9B21F28C4&t_flag=true&token=a43acba1c90752f93e51f64364b71d9c&user_id=7c19f276d626928a611e0f58eeaddc09", method: .get, parameters: nil).responseJSON { (response) in
            
            if let value = response.result.value {
                let dict = JSON(value)
                    let dataDict = dict["data"].dictionary
                        if let orderStorageItemLists = dataDict!["orderStorageItemList"]?.arrayObject{
//                            let line = orderStorageItemLists["line"].dictionary
//                            print(line)
                            
                            print(orderStorageItemLists)
                            
                            for dict in orderStorageItemLists {
                                self.activityDetail.append(ActivityDetailModel(dict: dict as! [String : Any]))
                            }
                    }
            
                finishedCallback()
            }
            
        }
    }
}



