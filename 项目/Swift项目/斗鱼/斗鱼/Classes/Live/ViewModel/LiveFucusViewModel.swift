//
//  LiveFucusViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class LiveFucusViewModel: LiveViewModel {

}


extension LiveFucusViewModel {
    
    func loadFucusData(completion: () -> ()) {
        
        let dataArray = SqliteTools.querySQL("SELECT * FROM t_focus;")
        
        for dict in dataArray {
            self.anchorModels.append(LiveAnchorModel(dict: dict))
        }
        
        completion()
    }
}
