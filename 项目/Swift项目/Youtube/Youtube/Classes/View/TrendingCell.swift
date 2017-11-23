//
//  TrendingCell.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/23.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed{ (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
