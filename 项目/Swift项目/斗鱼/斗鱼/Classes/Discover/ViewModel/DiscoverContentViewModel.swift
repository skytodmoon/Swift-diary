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
