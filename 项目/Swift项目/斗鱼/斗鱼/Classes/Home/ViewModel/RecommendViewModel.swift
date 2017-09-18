//
//  RecommendViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecommendViewModel: BaseViewModel {
    // MARK:- 懒加载属性
    lazy var cycleModels : [CycleModel] = [CycleModel]()
    fileprivate lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    fileprivate lazy var prettyGroup : AnchorGroup = AnchorGroup()
}

// MARK:- 发送网络请求
extension RecommendViewModel {
    // 请求推荐数据
    func requestData(_ finishCallback : @escaping (_ err: Error?) -> ()) {
        // 1.定义参数
        let parameters = ["limit" : "4", "offset" : "0", "time": Date.getCurrentTime()]
        
        // 2.创建Group
        let dGroup = DispatchGroup()
        
        // 3.请求第一部分推荐数据
        dGroup.enter()
        Alamofire.request("http://capi.douyucdn.cn/api/v1/getbigDataRoom", method: .get, parameters: nil).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                    if let dataArray = dict["data"].arrayObject {
                        self.bigDataGroup.tag_name = "热门"
                        self.bigDataGroup.icon_name = "home_header_hot"
                        
                        for dict in dataArray {
                            let anchor = AnchorModel(dict: dict as! [String : Any])
                            self.bigDataGroup.anchors.append(anchor)
                        }
                        dGroup.leave()
                }
            }
        }
        
        // 4.请求第二部分颜值数据
        dGroup.enter()
        Alamofire.request("http://capi.douyucdn.cn/api/v1/getVerticalRoom", method: .get, parameters: nil).responseJSON { (response) in
                
                guard response.result.isSuccess else {
                    return
                }
                
                if let value = response.result.value {
                    let dict = JSON(value)
                    if let dataArray = dict["data"].arrayObject {
                        self.prettyGroup.tag_name = "颜值"
                        self.prettyGroup.icon_name = "home_header_phone"
                        
                        for dict in dataArray {
                            let anchor = AnchorModel(dict: dict as! [String : Any])
                            self.prettyGroup.anchors.append(anchor)
                        }
                        dGroup.leave()
                    }
                    finishCallback(errno as? Error)
                }
        }

        // 5.请求2-12部分游戏数据
        dGroup.enter()
        loadAnchorData(isGroup: true, urlString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { _ in
            dGroup.leave()
        }
        
        
        // 6.所有的数据都请求到,之后进行排序
        dGroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            
            finishCallback(nil)
        }
    }
    
    // 请求无线轮播的数据
    func requestCycleData(_ finishCallback : @escaping (_ err: Error?) -> ()) {
        
        Alamofire.request("http://www.douyutv.com/api/v1/slide/6", method: .get, parameters: ["version" : "2.300"]).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                return
            }
            
            if let value = response.result.value {
                let dict = JSON(value)
                if let dataArray = dict["data"].arrayObject {
                    for dict in dataArray {
                        self.cycleModels.append(CycleModel(dict: dict as! [String : Any]))
                    }
                    finishCallback(nil)
                }
                finishCallback(errno as? Error)
            }
        }
        
    }
}

extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
