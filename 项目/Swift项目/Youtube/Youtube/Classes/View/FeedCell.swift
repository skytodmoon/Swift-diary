//
//  FeedCell.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/17.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class FeedCell: BaseCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
     lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.whiteColor()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var videos: [Video]?
    
    let cellId = "cellId"
    
    func fetchVideos(){
        ApiService.sharedInstance.fetchVideos { (videos:[Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        fetchVideos()
        backgroundColor = .brownColor()
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        collectionView.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellId")

    }
    
    
    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! VideoCell
        cell.video = videos?[indexPath.item]
        return cell
    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let height = (self.view.frame.width - 16 - 16) * 9 / 16
//        return CGSizeMake(self.view.frame.width, height + 80)
//    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}
