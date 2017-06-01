//
//  RecommendViewModel.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class RecommendViewModel{
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    private lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    private lazy var prettyGroup : AnchorGroup = AnchorGroup()
}

//MARK : - 发送网络请求
extension RecommendViewModel{
    func requestData(finishCallback : () -> () ){
        //定义参数
        let paramters = ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime()]
        //创建Group
        
        let dgroup = dispatch_group_create()
        
        
        //请求推荐数据
        dispatch_group_enter(dgroup)
        NetworkTools.requestData(.GET, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : NSDate.getCurrentTime()]) { (result) in
            
            guard let resultDict = result as? [String : NSObject] else { return }
            
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            
            dispatch_group_leave(dgroup)
                            print("0")
        }
        
        //请求颜值数据
        dispatch_group_enter(dgroup)
        NetworkTools.requestData(.GET, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: paramters) { (result) in
            
            guard let resultDict = result as? [String : NSObject] else { return }
            
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                    self.prettyGroup.anchors.append(anchor)
            }
            dispatch_group_leave(dgroup)
                print("1")
        }
        
        //请求游戏数据
        dispatch_group_enter(dgroup)
        NetworkTools.requestData(.GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: paramters) { (result) in
            
            guard let resultDict = result as? [String : NSObject] else { return }
            
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            for dict in dataArray {
                            let group = AnchorGroup(dict: dict)
                            self.anchorGroups.append(group)
                    }
                        dispatch_group_leave(dgroup)
                            print("2-12")
                }
        //所有的数据都请求到，进行排序
        dispatch_group_notify(dgroup, dispatch_get_main_queue()){
            self.anchorGroups.insert(self.prettyGroup, atIndex: 0)
            self.anchorGroups.insert(self.bigDataGroup, atIndex: 1)
            
            finishCallback()
        }
        //请求趣玩数据
    }
}