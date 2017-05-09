//
//  PhotoBrowserController.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit


private let PhotoBrowserCellReuseIdentifier = "PhotoBrowserCellReuseIdentifier"

class PhotoBrowserController: UIViewController {
    
    var currentIndex: Int?
    var pictureURLs: [NSURL]?
    init(index: Int, urls: [NSURL])
    {
        currentIndex = index
        pictureURLs = urls
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setupUI()
    }
    
    private func setupUI(){
        
    }
    
    
    func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func save() {
        
    }
    //MARK: - 懒加载关闭按钮
    private lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("关闭", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.darkGrayColor()
        btn.addTarget(self, action: #selector(OAuthViewController.close), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    //MARK: - 懒加载保存按钮
    private lazy var saveBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("保存", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.darkGrayColor()
        btn.addTarget(self, action: #selector(PhotoBrowserController.save), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    //MARK: - 懒加载UICollectionView
    private lazy var collectionView: UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: PhotoBrowserLayout())
    
}
//MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension PhotoBrowserController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    
}
//MARK: - UICollectionViewLayout
class PhotoBrowserLayout: UICollectionViewLayout {
    
    override func prepareLayout() {
        
    }
}
