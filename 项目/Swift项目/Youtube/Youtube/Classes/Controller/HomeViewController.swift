//
//  HomeViewController.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
//    var viodes: [Video]={
//        
//        var kanyerChannel = Channel()
//        kanyerChannel.name = "KanyeIsTheBestChannel"
//        kanyerChannel.profileImageName = "kanye_profile"
//        
//        var blankSpaceVideo = Video()
//        blankSpaceVideo.title = "Taylor Swift - Blank Space"
//        blankSpaceVideo.thumnailImageName = "taylor_swift_blank_space"
//        blankSpaceVideo.channel = kanyerChannel
//        blankSpaceVideo.numberOfViews = 234234890
//        
//        var badBloodVideo = Video()
//        badBloodVideo.title = "Taylor Swift - Bad Blood featuring Kendrick Lamar"
//        badBloodVideo.thumnailImageName = "taylor_swift_bad_space"
//        badBloodVideo.channel = kanyerChannel
//        badBloodVideo.numberOfViews = 1234234
//        return [blankSpaceVideo,badBloodVideo]
//    }()
    
    var videos: [Video]?
    
    func fetchVideos(){
        let url = NSURL(string: "http://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                self.videos = [Video]()
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumnailImageName = dictionary["thumbnail_image_name"] as? String
                    let channeDicitionary = dictionary["channel"] as! [String: AnyObject]
                    let channel = Channel()
                    channel.name = channeDicitionary["name"] as? String
                    channel.profileImageName = channeDicitionary["profile_image_name"] as? String
                    video.channel = channel
                    self.videos?.append(video)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.collectionView?.reloadData()
                })
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
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
        let searchImage = UIImage(named: "navSearch")?.imageWithRenderingMode(.AlwaysOriginal)
        let searchBarButton = UIBarButtonItem(image: searchImage,style: .Plain, target: self,action: #selector(handleSearch))
        let moreButton = UIBarButtonItem(image: UIImage(named:"navSettings")?.imageWithRenderingMode(.AlwaysOriginal),style: .Plain, target: self,action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton,searchBarButton]
    }
    
    let settingsLauncher = SettingsLauncher()
    
    func handleMore(){
        settingsLauncher.showSettings()
    }
    
    func handleSearch(){
        print(123)
    }
    
    
    private func setupMenuBar(){
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos?.count ?? 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath) as! VideoCell
        cell.video = videos?[indexPath.item]
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSizeMake(view.frame.width, height + 80)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

}
