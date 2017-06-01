//
//  FunnyViewModel.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class FunnyViewModel : BaseViewModel {
    
}

extension FunnyViewModel {
    func loadFunnyData(_ finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroup: false, urlString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit" : 30, "offset" : 0], finishedCallback: finishedCallback)
    }
}
