//
//  HomeViewController.swift
//  Youtube
//
//  Created by 金亮齐 on 2017/11/15.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    let titles = ["Home","Trending","Subscriptions","Account"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupMenuBar()
        setuoNavBarButtons()
        // Do any additional setup after loading the view.
    }
    
    func setupCollectionView(){
        navigationItem.title = "Home"
        navigationController?.navigationBar.translucent = false
        
        let titleLabel = UILabel(frame: CGRectMake(0,0,view.frame.width - 32,view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        navigationItem.titleView =  titleLabel
        
        
        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flowlayout.scrollDirection = .Horizontal
            flowlayout.minimumInteritemSpacing = 0
        }

        
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerClass(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.pagingEnabled = true
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeControler = self
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
        scrollToMenuIndex(2)
//        settingsLauncher.showSettings()
    }
    
    func scrollToMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(forRow: menuIndex,inSection: 0)
        collectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: .None, animated: true)
        
        setTitleForIndex(menuIndex)

    }
    
    private func setTitleForIndex(index: Int) {
        if let titleLabel = navigationItem.titleView as? UILabel {
            titleLabel.text = "\(titles[index])"
        }
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
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstrain?.constant = scrollView.contentOffset.x / 4
    }
    

    
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.memory.x / view.frame.width
        
        let indexPath = NSIndexPath(forItem: Int(index),inSection: 0)
        menuBar.collectionView.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: .None)
        
        setTitleForIndex(Int(index))
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! FeedCell
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, view.frame.height - 50 )
    }


}
