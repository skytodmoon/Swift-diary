//
//  HomeViewController.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    var videos: [Video]?

    func fetchVideos(){
        ApiService.sharedInstance.fetchVideos { (videos:[Video]) in
            self.videos = videos
            self.collectionView?.reloadData()
        }
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
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    func handleMore(){
        settingsLauncher.showSettings()
    }
    
    func handleSearch(){
        print(123)
    }
    
    func showControllerForSetting(setting: Setting){
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.view.backgroundColor = UIColor.whiteColor()
        dummySettingsViewController.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
    }
    
    
    private func setupMenuBar(){
        navigationController?.hidesBarsOnSwipe = true
        
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstraintsWithFormat("H:|[v0]|", views: redView)
        view.addConstraintsWithFormat("V:[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
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
