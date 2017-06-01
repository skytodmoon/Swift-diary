//
//  AmuseViewModel.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class AmuseViewModel : BaseViewModel {
}

extension AmuseViewModel {
    func loadAmuseData(_ finishedCallback: @escaping () -> ()) {
        loadAnchorData(isGroup: true, urlString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
    }
}
