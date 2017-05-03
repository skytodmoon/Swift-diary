//
//  MallFlowLayout.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/22.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class MallFlowLayout: UICollectionViewFlowLayout {
    
    override func prepareLayout() {
        super.prepareLayout()
        
        // 基本设置
        minimumLineSpacing = 1
        minimumInteritemSpacing = 1
        scrollDirection = .Vertical
        let width = (ScreenWidth - 2) / 2.0
        itemSize = CGSize(width: width, height: width)
        // 即使界面内容没有超过界面大小,也要竖直方向滑动
        //        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.whiteColor()
    }


}
