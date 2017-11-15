//
//  ViewController.swift
//  FacebookFeed
//
//  Created by 金亮齐 on 2017/11/14.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

let  cellId = "cellId"


class FeedController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let memoryCapacity = 500 * 1024 * 1024
        let diskCapcity = 500 * 1024 * 1024
        let urlCache = NSURLCache(memoryCapacity: memoryCapacity,diskCapacity: diskCapcity,diskPath: "myDiskPath")
        NSURLCache.setSharedURLCache(urlCache)
        
        
        let postMark = Post()
        postMark.name = "章紫玲"
        postMark.statusText = "我是一位舞蹈老师"
        postMark.profileImageName = "headImage1"
        postMark.statusImageName = "YouName2"
        postMark.numLikes = 400
        postMark.numContent = 123
        postMark.statusInageUrl = "http://s3-us-west-2.amazonaws.com/letsbuildthatapp/mark_zuckerberg_background.jpg"
        
        let postSteve = Post()
        postSteve.name = "醉看红尘这场梦"
        postSteve.statusText = "我本以为我只爱代码，自从“她”的出现改变了我，\n让我逐渐的产生好感，冷漠>关注>喜欢>爱意，让我经历了四种变化，她是我的另一半，\n她的舞蹈身影让我迷恋，她弹的钢琴让我陶醉，爱到写代码都会发呆想她，很感谢上帝赐予我这么好的女孩。"
        postSteve.profileImageName = "headImage"
        postSteve.statusImageName = "You name"
        postSteve.numLikes = 1000
        postSteve.numContent = 55
        postSteve.statusInageUrl = "http://s3-us-west-2.amazonaws.com/letsbuildthatapp/steve_jobs_background.jpg"
        
        let postGandhi = Post()
        postGandhi.name = "测试"
        postGandhi.statusText = "测试测试测试测试测试测试测试测试测试测试测试测试测试\n测试测试测试测试测试测试测试测试测试测试测试测试测试\n测试测试测试测试测试测试测试测试测试测试测试测试测试\n"
        postGandhi.profileImageName = "headImage"
        postGandhi.statusImageName = "YouName2"
        postGandhi.numLikes = 1000
        postGandhi.numContent = 55
        postGandhi.statusInageUrl = "http://s3-us-west-2.amazonaws.com/letsbuildthatapp/gandhi_status.jpg"
        
        posts.append(postMark)
        posts.append(postSteve)
        posts.append(postGandhi)
        
        navigationItem.title = "内容"
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.registerClass(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let feedCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! FeedCell
        
        feedCell.post = posts[indexPath.item]
        feedCell.feedController = self
        return feedCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        
        if let statusText = posts[indexPath.item].statusText{
            let rect = NSString(string: statusText).boundingRectWithSize(CGSizeMake(view.frame.width, 1000), options: NSStringDrawingOptions.UsesFontLeading.union(NSStringDrawingOptions.UsesLineFragmentOrigin), attributes: [NSFontAttributeName:UIFont.systemFontOfSize(14)], context: nil)
            
            let knownHeigth: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            return CGSizeMake(view.frame.width, rect.height + knownHeigth + 24)
        }
        
        return CGSizeMake(view.frame.width, 500)
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    func animateImageView(statusImageView: UIImageView){
        
        if let startingFrame = statusImageView.superview?.convertRect(statusImageView.frame, toView: nil){
            let zoomImageView = UIView()
            zoomImageView.backgroundColor = UIColor.redColor()
            zoomImageView.frame = statusImageView.frame
            view.addSubview(zoomImageView)
            
            UIView.animateWithDuration(0.75) {()-> Void in
                let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - height / 2
                zoomImageView.frame = CGRectMake(0, y, self.view.frame.width, height)
            }
        }
    }
}





