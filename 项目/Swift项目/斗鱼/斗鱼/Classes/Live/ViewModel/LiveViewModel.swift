//
//  LiveViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LiveViewModel {
    
    // MARK: --  定义几个数组,用来保存所有的数据
    lazy var anchorModels = [LiveAnchorModel]()
    
    
}

extension LiveViewModel {
    
    func loadHomeData(type: LiveStyle,index : Int,  finishedCallback : @escaping () -> ()) {
        Alamofire.request("http://qf.56.com/home/v4/moreAnchor.ios", method: .get, parameters: ["type" : type.type, "index" : index, "size" : 48]).responseJSON { (response) in
                if let value = response.result.value {
                    let dict = JSON(value)
                        let messageDict = dict["message"].dictionary
                               if let anchorsArray = messageDict?["anchors"]?.arrayObject {
                                for (index,dict) in anchorsArray.enumerated() {
                                    let anchor = LiveAnchorModel(dict:dict as! [String : Any])
                                    anchor.isEvenIndex = index % 2 == 0
                                    self.anchorModels.append(anchor)
                                }
                                finishedCallback()
                            }
            }
        }
        
    }
}
