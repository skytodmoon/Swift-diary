//
//  LiveViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class LiveViewModel {
    
    // MARK: --  定义几个数组,用来保存所有的数据
    lazy var anchorModels = [LiveAnchorModel]()
    
    
}

extension LiveViewModel {
    
    func loadHomeData(type: LiveStyle,index : Int,  finishedCallback : @escaping () -> ()) {
        
        NetWorkTools.requestData1(.get, urlString: "http://qf.56.com/home/v4/moreAnchor.ios", parameters: ["type" : type.type, "index" : index, "size" : 48]) { (result) in
                    
            guard let resultDict = result as? [String : Any],
                let messageDict = resultDict["message"] as? [String : Any],
                let anchorsArray = messageDict["anchors"] as? [[String : Any]]
                else {
                    return
            }
            
            for (index,dict) in anchorsArray.enumerated() {
                let anchor = LiveAnchorModel(dict: dict)
                anchor.isEvenIndex = index % 2 == 0
                // 将所有的模型添加到数组中
                self.anchorModels.append(anchor)
            }
            finishedCallback()
        }
    }
}
