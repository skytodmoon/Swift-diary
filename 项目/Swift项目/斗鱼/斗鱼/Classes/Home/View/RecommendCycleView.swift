//
//  RecommendCycleView.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import XRCarouselView

class RecommendCycleView: UIView {

    // MARK: - lazy属性
    fileprivate lazy var carouselView: XRCarouselView = { [weak self] in
        let carouselView = XRCarouselView()
        carouselView.time = 2.0
        carouselView.pagePosition = PositionBottomCenter
        carouselView.setPageImage(UIImage(named: "other"), andCurrentPageImage: UIImage(named: "current"))
        carouselView.delegate = self
        return carouselView
        }()
    
    // MARK: - 模型数组
    var cycleModels:[CycleModel]? {
        didSet {
            guard let cycleModels = cycleModels else { return }
            
            var titlesArr = [String]()
            var picURLArr = [String]()
            for model in cycleModels {
                titlesArr.append(model.title)
                picURLArr.append(model.pic_url)
            }
            carouselView.imageArray = picURLArr
            carouselView.describeArray = titlesArr
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpMainView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        carouselView.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 初始化UI
extension RecommendCycleView {
    fileprivate func setUpMainView() {
        addSubview(carouselView)
    }
}


// MARK: - XRCarouselViewDelegate
extension RecommendCycleView: XRCarouselViewDelegate {
    func carouselView(_ carouselView: XRCarouselView!, clickImageAt index: Int) {
        if cycleModels?.count == 0 {
            return
        }
        let cycleModel = cycleModels![index]
        // 1.创建NormalRoomVc
        let webVC = WebViewController(navigationTitle: cycleModel.title, urlStr: cycleModel.anchor!.jumpUrl!)
        
        // 2.以Push方式弹出
        topViewController()!.navigationController?.pushViewController(webVC, animated: true)
    }
}
