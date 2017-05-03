//
//  ProfileViewController.swift
//  花田小憩
//
//  Created by 金亮齐 on 2016/12/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit
// 作者简介的cell重用标识符
private let UserCellReuseIdentifier = "UserCollectionCell"

class ProfileViewController: ColumnistViewController {
    
    override func setup() {
        super.setup()
        
        collectionView?.registerClass(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCellReuseIdentifier)
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(UserCellReuseIdentifier, forIndexPath: indexPath) as!  UserCollectionViewCell
            cell.author = author
            return cell
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ArticlesreuseIdentifier, forIndexPath: indexPath) as! ArticlesCollectionViewCell
        let count = articles?.count ?? 0
        if count > 0 {
            cell.article = articles![indexPath.item]
        }
        return cell
        
    }
    
    // MAKR: - UICollectionViewDelegateFlowLayout
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if indexPath.section == 0 {
            return CGSizeMake(UIScreen.mainScreen().bounds.width
                , 160);
        }else{
            return CGSizeMake((UIScreen.mainScreen().bounds.width - 24)/2, 230);
        }
    }


}
