//
//  GameViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GameViewModel: NSObject {
    lazy var games : [GameModel] = [GameModel]()
}



extension GameViewModel {
    func loadAllGameData(_ finishedCallback: @escaping () -> ()) {

        Alamofire
            .request("http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"])
            .responseJSON { (response) in
                
                if let value = response.result.value {
                    let dict = JSON(value)
                        if let dataArray = dict["data"].arrayObject {
                            for dict in dataArray {
                                self.games.append(GameModel(dict: dict as! [String : Any]))
                        }
                        finishedCallback()
                    }
                    
                }
        }

    }
}
