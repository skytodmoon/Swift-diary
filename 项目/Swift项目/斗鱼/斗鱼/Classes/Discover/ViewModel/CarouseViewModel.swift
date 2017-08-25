//
//  CarouseViewModel.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import MJExtension
import Alamofire
import SwiftyJSON

class CarouseViewModel: NSObject {
    /// 轮播图
    lazy var banners = [String]()
    lazy var links = [String]()
    lazy var names = [String]()
    lazy var carousels : [CarouseModel] = [CarouseModel]()
    
    func loadCarouselData(_ complection :  @escaping () -> ()) {
        Alamofire.request("http://qf.56.com/home/v4/getBanners.ios", method: .get).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                print(dict)
                    let msgDict = dict["message"].dictionary
                    if let banners  = msgDict!["banners"]?.arrayObject {
                        var urlArrayM = [String]()
                        var linkArrayM = [String]()
                        var nameArrayM = [String]()
                        
                        for dict in banners {
                                self.carousels.append(CarouseModel(dict: dict as! [String : Any]))
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
                    }
                }
            }
        }
}
