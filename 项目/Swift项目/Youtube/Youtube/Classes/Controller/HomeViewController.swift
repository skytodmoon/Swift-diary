//
//  HomeViewController.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var viodes: [Video]={
        
        var kanyerChannel = Channel()
        kanyerChannel.name = "KanyeIsTheBestChannel"
        kanyerChannel.profileImageName = "kanye_profile"
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = kanyerChannel
        blankSpaceVideo.numberOfViews = 234234890
        
        var badBloodVideo = Video()
        badBloodVideo.title = "Taylor Swift - Bad Blood featuring Kendrick Lamar"
        badBloodVideo.thumnailImageName = "taylor_swift_bad_space"
        badBloodVideo.channel = kanyerChannel
        badBloodVideo.numberOfViews = 1234234
        return [blankSpaceVideo,badBloodVideo]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.translucent = false
        
        let titleLabel = UILabel(frame: CGRectMake(0,0,view.frame.width - 32,view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        navigationItem.titleView =  titleLabel
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        setupMenuBar()
        setuoNavBarButtons()
        // Do any additional setup after loading the view.
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    func setuoNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.imageWithRenderingMode(.AlwaysOriginal)
        let searchBarButton = UIBarButtonItem(image: searchImage,style: .Plain, target: self,action: #selector(handleSearch))
        let moreButton = UIBarButtonItem(image: UIImage(named:"nav_more_icon")?.imageWithRenderingMode(.AlwaysOriginal),style: .Plain, target: self,action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton,searchBarButton]
    }
    
    private func setupMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    
    func handleMore(){
        print(321)
    }
    
    func handleSearch(){
        print(123)
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viodes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath) as! VideoCell
        cell.video = viodes[indexPath.item]
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSizeMake(view.frame.width, height + 68)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

}
