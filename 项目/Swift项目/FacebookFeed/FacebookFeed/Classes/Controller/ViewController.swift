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
        
        if let path = NSBundle.mainBundle().pathForResource("all_posts", ofType: "json"){
            
            do{
                
                let data = try(NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe))
                
                let jsonDictionary = try(NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers))
                
                if let postsArray = jsonDictionary["posts"] as? [[String: AnyObject]]{
                    self.posts = [Post]()
                    for postDictionary in postsArray {
                        let post = Post()
                        post.setValuesForKeysWithDictionary(postDictionary)
                        self.posts.append(post)
                    }
                }
            }catch let err {
                print(err)
            }
        }
        
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





