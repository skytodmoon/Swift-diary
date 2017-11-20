//
//  FeaturedAppsController.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/20.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var appCategories: [AppCategory]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appCategories = AppCategory.samopleAppCategoies()
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! CategoryCell
    
        // Configure the cell
    
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 230)
    }


}
