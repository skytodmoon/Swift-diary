//
//  ColumnVM.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire

class ColumnVM: NSObject {
    
    lazy var columnArray: [ColumnModel] = [ColumnModel]()
    
    func loadColumnData(finishedCallback : @escaping () -> ()) {
        
        NetworkTool.request(type: .GET, urlString: COLUMN_TABBAR_URL, paramters: nil) { (result) in
            print(COLUMN_TABBAR_URL)
            print("请求栏目数据结果",result)
        }
    }
}
