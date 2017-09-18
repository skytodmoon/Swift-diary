//
//  RefreshHeder.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/13.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import MJRefresh

class RefreshHeder: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        // 设置普通状态图片
//        var images = [UIImage]()
//        for index in 0..<30 {
//            let image = UIImage(named: "dropdown_0\(index)")
//            images.append(image!)
//        }
//        setImages(images, for: .idle)
//        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//        var refreshingImages = [UIImage]()
//        for index in 0..<16 {
//            let image = UIImage(named: "dropdown_loading_0\(index)")
//            refreshingImages.append(image!)
//        }
        // 设置正在刷新状态的动画图片
//        setImages(refreshingImages, for: .refreshing)
        /// 设置state状态下的文字
        setTitle("下拉可以刷新", for: .idle)
        setTitle("松开立即刷新", for: .pulling)
        setTitle("正在刷新数据中", for: .refreshing)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
//        gifView.contentMode = .center
//        gifView.frame = CGRect(x: 0, y: 4, width: mj_w, height: 25)
//        stateLabel.font = UIFont.systemFont(ofSize: 12)
//        stateLabel.frame = CGRect(x: 0, y: 35, width: mj_w, height: 14)
//        lastUpdatedTimeLabel.isHidden = true
    }

}
