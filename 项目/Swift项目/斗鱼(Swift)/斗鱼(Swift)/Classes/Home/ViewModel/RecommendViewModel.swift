//
//  RecommendViewModel.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/5/31.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class RecommendViewModel{
    
}

//MARK : - 发送网络请求
extension RecommendViewModel{
    func requestData(){
        NetworkTools.requestData(.GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime()]) { (result) in
            print(result)
        }
        
        //请求推荐数据
        
        
        //请求颜值数据
        
        
        //请求游戏数据
        
        
        //请求趣玩数据
    }
}