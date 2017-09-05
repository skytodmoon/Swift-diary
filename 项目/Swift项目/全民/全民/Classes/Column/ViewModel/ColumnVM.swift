//
//  ColumnVM.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ColumnVM: NSObject {
    
    lazy var columnArray: [ColumnModel] = [ColumnModel]()
    
    func loadColumnData(finishedCallback : @escaping () -> ()) {
//        NetworkTool.request(type: .GET, urlString: "http://api.m.panda.tv/index.php", paramters: ["method":"category.list", "type":"game", "__version":"1.1.7.1305", "__plat":"ios", "__channel":"appstore"]) { (result) in
//            guard let resultDict = result as? [String: NSObject] else { return }
//            guard let dataArray = resultDict["data"] as? [[String: NSObject]] else { return }
//            for dict in dataArray {
//                self.columnArray.append(ColumnModel(dict: dict))
//            }
//        }
        
        NetworkTool.request(type: .GET, urlString: "http://www.quanmin.tv/json/", paramters: nil) { (result) in
            guard let resultDict = result as? [String: NSObject] else { return }
            guard let dataArray = resultDict["data"] as? [[String: NSObject]] else { return }
            for dict in dataArray {
                self.columnArray.append(ColumnModel(dict: dict))
            }
        }
    }
}
