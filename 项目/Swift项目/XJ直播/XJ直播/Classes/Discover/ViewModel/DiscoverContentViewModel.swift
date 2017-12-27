//
//  DiscoverContentViewModel.swift
//  XJ直播
//
//  Created by 金亮齐 on 2017/12/26.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DiscoverContentViewModel: HomeViewModel {

}
extension DiscoverContentViewModel {
    
    func loadContentData(_ complection: @escaping () -> ()) {
        let url = "http://qf.56.com/home/v4/guess.ios"
        let params = ["count": 27]
        Alamofire.request(url, parameters: params).responseJSON { (response) in

            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                let dataDict = json["message"].dictionary
                if let dataArray = dataDict!["anchors"]?.arrayObject{
                    for dict in dataArray {
                        self.anchorModels.append(AnchorModel(dict: dict as! [String : AnyObject]))
                    }
                }
            }
            // 5.回调
            complection()
        }
    }
}
