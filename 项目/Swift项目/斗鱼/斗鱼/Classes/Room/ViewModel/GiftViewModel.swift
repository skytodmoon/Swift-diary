//
//  GiftViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/28.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class GiftViewModel {
    
    lazy var giftlistData : [GiftPackageModel] = [GiftPackageModel]()
    
}

extension GiftViewModel {
    
    func loadGiftData(finishedCallBack:@escaping () -> ())  {
        
        NetWorkTools.requestData1(.get, urlString: "http://qf.56.com/pay/v4/giftList.ios", parameters: ["type" : 0, "page" : 1, "rows" : 150]) { (result) in
            guard let resultDict = result as? [String : Any] else { return }
            
            guard let dataDict = resultDict["message"] as? [String : Any] else { return }
            print("---->" + "\(result)")
            for i in 0..<dataDict.count {
                guard let dict = dataDict["type\(i+1)"] as? [String : Any] else { continue }
                self.giftlistData.append(GiftPackageModel(dict: dict))
            }
            
            self.giftlistData = self.giftlistData.filter({ return $0.t != 0 }).sorted(by: { return $0.t > $1.t })
            
            finishedCallBack()
            
        }
    }
}
