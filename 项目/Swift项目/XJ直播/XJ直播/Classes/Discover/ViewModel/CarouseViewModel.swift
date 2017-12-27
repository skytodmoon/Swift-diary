//
//  XJCarouseViewModel.swift
//  XJ直播
//
//  Created by 金亮齐 on 2017/12/26.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit
import MJExtension

class CarouseViewModel{
    /// 轮播图
    lazy var banners = [String]()
    lazy var links = [String]()
    lazy var names = [String]()
    lazy var carousels : [CarouseModel] = [CarouseModel]()
    
    func loadCarouselData(_ complection :  @escaping () -> ()) {
        
        NetworkTools.requestData(.get, URLString: "http://qf.56.com/home/v4/getBanners.ios", finishedCallback: { (result : Any) in
            // 1.转成字典
            guard let resultDict = result as? [String : Any] else { return }
            
            // 2.根据message取出数据
            guard let msgDict = resultDict["message"] as? [String : Any] else { return }
            
            // 3.根据banners取出数据
            guard let banners = msgDict["banners"] as? [[String : Any]] else { return }
            var urlArrayM = [String]()
            var linkArrayM = [String]()
            var nameArrayM = [String]()
            // 4.转成模型对象
            for dict in banners {
                self.carousels.append(CarouseModel(dict: dict))
            }
            
            for i in 0..<self.carousels.count {
                let model = CarouseModel.mj_object(withKeyValues: self.carousels[i])
                urlArrayM.append((model?.picUrl)!)
                linkArrayM.append((model?.linkUrl)!)
                nameArrayM.append((model?.name)!)
                
            }
            self.banners = urlArrayM
            self.links = linkArrayM
            self.names = nameArrayM
            complection()
            
        })
    }

}
