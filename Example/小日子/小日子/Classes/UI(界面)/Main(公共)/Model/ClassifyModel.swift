//
//  ClassifyModel.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ClassifyModel: NSObject {

}



class DetailModel: NSObject {
    var msg: String?
    var code: Int = -1
    var list: [EventModel]?
    
    static func customClassMapping() -> [String : String]? {
        return ["list" : "\(EventModel.self)"]
    }
    
    /// 加载详情模型
    class func loadDetails(completion: (data: DetailModel?, error: NSError?) -> ()) {
        loadDatas("Details", isShowDis: false, completion: completion)
    }
    
    /// 加载美辑点击按钮的更多模型
    class func loadMore(completion: (data: DetailModel?, error: NSError?) -> ()) {
        loadDatas("More", isShowDis: false, completion: completion)
    }
    
    /// 加载附近店铺数据
    class func loadNearDatas(completion: (data: DetailModel?, error: NSError?) -> ()) {
        loadDatas("Nears", isShowDis: true, completion: completion)
    }
    
    private class func loadDatas(fileName: String, isShowDis: Bool, completion: (data: DetailModel?, error: NSError?) -> ()) {
        
    }
}
