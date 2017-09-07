//
//  MessageViewModel.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class MessageViewModel: NSObject {
    lazy var message : [MessageModel] = [MessageModel]()
}

extension MessageViewModel {
    
    func loadMessageData(_ finishedCallback: @escaping () -> ()) {
        
        Alamofire.request("http://www.youdianbus.cn/ydbus-api/api/events/msg?", method: .get, parameters: ["dev_id" : "D781FAF8-C667-4FBA-B2FE-49E9B21F28C4", "token" : "b59ffee20074282a964cf74fd39a97cd", "user_id" : "7c19f276d626928a611e0f58eeaddc09"]).responseJSON { (response) in
            
            if let value = response.result.value {
                let dict = JSON(value)
                if let dataArray = dict["data"].dictionary {
                    if let eventsList = dataArray["eventsList"]?.arrayObject {
                        print(eventsList)
                    }
                        finishedCallback()
                }
                
            }
        }
        
    }
    
}
