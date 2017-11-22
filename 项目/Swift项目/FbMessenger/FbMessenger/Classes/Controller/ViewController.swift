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
    
    func setupData(){
        
        let mark = Friend()
        mark.name = "Mark Zuckeroery"
        mark.profileImageName = "headImage"
        
        let message = Message()
        message.friend = mark
        message.text = "Hello my name is Mark. Nice to meet you"
        message.date = NSDate()
        
        messages = [message]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView!.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(FriendCell.self, forCellWithReuseIdentifier: cellId)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 100)
    }

}

