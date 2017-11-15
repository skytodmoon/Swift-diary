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
        postMark.name = "马克·扎克伯格"
        postMark.statusText = "Facebook创始人兼首席执行官"
        postMark.profileImageName = "FaceHead"
        postMark.statusImageName = "YouName2"
        postMark.numLikes = 400
        postMark.numContent = 123
        postMark.statusInageUrl = "http://s3-us-west-2.amazonaws.com/letsbuildthatapp/mark_zuckerberg_background.jpg"
        
        let postSteve = Post()
        postSteve.name = "史蒂夫·乔布斯"
        postSteve.statusText = "史蒂夫·乔布斯（Steve Jobs，1955年2月24日—2011年10月5日[2]  ），出生于美国加利福尼亚州旧金山，\n美国发明家、企业家、美国苹果公司联合创办人。1976年4月1日，乔布斯签署了一份合同，决定成立一家电脑公司。 \n 1977年4月，乔布斯在美国第一次计算机展览会展示了苹果Ⅱ号样机。1997年苹果推出iMac，创新的外壳颜色透明设计使得产品大卖，并让苹果度过财政危机。[4] \n 2011年8月24日，史蒂夫·乔布斯向苹果董事会提交辞职申请。乔布斯被认为是计算机业界与娱乐业界的标志性人物，他经历了苹果公司几十年的起落与兴衰，先后领导和推出了麦金塔计算机（Macintosh）、iMac、iPod、iPhone、iPad等风靡全球的电子产品，深刻地改变了现代通讯、娱乐、生活方式。乔布斯同时也是前Pixar动画公司的董事长及行政总裁。2011年10月5日，史蒂夫·乔布斯因患胰腺癌病逝，享年56岁"
        postSteve.profileImageName = "SteveHeader"
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
    
    let zoomImageView = UIImageView()
    let blackBackgroundView = UIView()
    let navBarCoverView = UIView()
    let tabBarCoverView = UIView()
    var statusImageView: UIImageView?

    func animateImageView(statusImageView: UIImageView){
        
        self.statusImageView = statusImageView
        
        if let startingFrame = statusImageView.superview?.convertRect(statusImageView.frame, toView: nil){
            
            statusImageView.alpha = 0
            
            blackBackgroundView.frame = self.view.frame
            blackBackgroundView.backgroundColor = UIColor.blackColor()
            blackBackgroundView.alpha = 0
            view.addSubview(blackBackgroundView)
            
            
            navBarCoverView.frame = CGRectMake(0, 0, 1000, 20 + 44)
            navBarCoverView.backgroundColor = UIColor.blackColor()
            navBarCoverView.alpha = 0
            
            if let keyWindow = UIApplication.sharedApplication().keyWindow{
                keyWindow.addSubview(navBarCoverView)
                tabBarCoverView.frame = CGRectMake(0, keyWindow.frame.height - 49, 1000, 49)
                tabBarCoverView.alpha = 0
                tabBarCoverView.backgroundColor = UIColor.blackColor()
                keyWindow.addSubview(tabBarCoverView)
            }
            
            zoomImageView.backgroundColor = UIColor.redColor()
            zoomImageView.frame = startingFrame
            zoomImageView.userInteractionEnabled = true
            zoomImageView.image = statusImageView.image
            zoomImageView.contentMode = .ScaleAspectFill
            zoomImageView.clipsToBounds = true
            view.addSubview(zoomImageView)
            
            zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(FeedController.zoomOut)))
            
            UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .CurveEaseOut, animations: {() -> Void in
                let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - height / 2
                self.zoomImageView.frame = CGRectMake(0, y, self.view.frame.width, height)
                self.blackBackgroundView.alpha = 1
                self.navBarCoverView.alpha = 1
                self.tabBarCoverView.alpha = 1
                }, completion: nil)
        }
    }
    
    func zoomOut() {
        if let startingFrame = statusImageView!.superview?.convertRect(statusImageView!.frame, toView: nil){
            UIView.animateWithDuration(0.75, animations: { () -> Void in
                    self.zoomImageView.frame = startingFrame
                    self.blackBackgroundView.alpha = 0
                    self.navBarCoverView.alpha = 0
                    self.tabBarCoverView.alpha = 0
                }, completion: { (didComplete) -> Void in
                    self.zoomImageView.removeFromSuperview()
                    self.blackBackgroundView.removeFromSuperview()
                    self.navBarCoverView.removeFromSuperview()
                    self.tabBarCoverView.removeFromSuperview()
                    self.statusImageView?.alpha = 1
            })
        }

    }
}





