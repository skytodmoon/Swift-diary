//
//  DiscoverContentViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DiscoverContentViewModel: LiveViewModel {

}


extension DiscoverContentViewModel {
    
    func loadContentData(_ complection: @escaping () -> ()) {
        
//        NetWorkTools.requestData1(.get, urlString: "http://qf.56.com/home/v4/guess.ios", parameters: ["count" : 27]) { (result) in
//            
//            // 1.转换成字典
//            guard let responseDict = result as? [String : Any] else {
//                return
//            }
//            // 2.取出内容
//            guard let msgDict = responseDict["message"] as? [String : Any] else { return }
//            
//            // 3.取出内容
//            guard let dataArray = msgDict["anchors"] as? [[String : Any]] else { return }
//            
//            // 4.转成模型对象
//            for dict in dataArray {
//                self.anchorModels.append(LiveAnchorModel(dict: dict))
//            }
//            // 5.回调
//            complection()
//        }
        
        Alamofire
            .request("http://qf.56.com/home/v4/guess.ios", parameters: ["count" : 27])
            .responseJSON { (response) in
                
                if let value = response.result.value {
                    let dict = JSON(value)
                    let message = dict["message"].dictionary
                        if let anchors  = message!["anchors"]?.arrayObject {
                            for dict in anchors {
                                self.anchorModels.append(LiveAnchorModel(dict: dict as! [String : Any]))
                            }
                            complection()
                    }
                    
            }
        }
    }
}
