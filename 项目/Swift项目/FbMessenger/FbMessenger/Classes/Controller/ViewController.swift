//
//  ViewController.swift
//  FbMessenger
//
//  Created by 金亮齐 on 2017/11/21.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class FriendsController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var messages: [Message]?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Recent"
        collectionView!.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(MessageCell.self, forCellWithReuseIdentifier: cellId)
        
        setupData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count{
            return count
        }
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MessageCell
        if let message = messages?[indexPath.item]{
            cell.message =  message
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 100)
    }

}

