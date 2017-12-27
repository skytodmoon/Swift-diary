//
//  HomeViewModel.swift
//  XJ直播
//
//  Created by 金亮齐 on 2017/12/26.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class HomeViewModel: NSObject {
    
    // MARK: --  定义几个数组,用来保存所有的数据
    lazy var anchorModels = [AnchorModel]()
}

extension HomeViewModel {
    
    
    func loadHomeData(type: HomeStyle,index : Int,  finishedCallback : @escaping () -> ()) {
        
        NetworkTools.requestData(.get, URLString: "http://qf.56.com/home/v4/moreAnchor.ios", parameters: ["type" : type.type, "index" : index, "size" : 48]) { (json) in
            
            guard let resultDict = json as? [String : Any],
                let messageDict = resultDict["message"] as? [String : Any],
                let anchorsArray = messageDict["anchors"] as? [[String : Any]]
                else {
                    return
            }
            
            // print(anchorsArray)
            
            for (index,dict) in anchorsArray.enumerated() {
                let anchor = AnchorModel(dict: dict)
                anchor.isEvenIndex = index % 2 == 0
                // 将所有的模型添加到数组中
                self.anchorModels.append(anchor)
            }
            finishedCallback()
        }
        
        
    }
}
