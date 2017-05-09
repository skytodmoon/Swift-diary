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
        
        view.addSubview(collectionView)
        view.addSubview(closeBtn)
        view.addSubview(saveBtn)
        
        closeBtn.snp_makeConstraints { (make) in
            make.right.equalTo(view).offset(-10)
            make.bottom.equalTo(view).offset(-10)
            make.height.equalTo(35)
            make.width.equalTo(100)
        }
        
        saveBtn.snp_makeConstraints { (make) in
            make.size.equalTo(closeBtn)
            make.left.equalTo(view).offset(10)
            make.bottom.equalTo(view).offset(-10)
        }
        
        collectionView.frame = UIScreen.mainScreen().bounds
        collectionView.dataSource = self
        collectionView.registerClass(PhotoBrowserCell.self, forCellWithReuseIdentifier: PhotoBrowserCellReuseIdentifier)
    }
    
    
    func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func save() {
        
        let index = collectionView.indexPathsForVisibleItems().last!
        let cell = collectionView.cellForItemAtIndexPath(index) as! PhotoBrowserCell
        let image = cell.iconView.image
        UIImageWriteToSavedPhotosAlbum(image!, self, #selector(PhotoBrowserController.image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    
    func image(image:UIImage, didFinishSavingWithError error:NSError?, contextInfo:AnyObject){
        if error != nil
        {
            // TODO
            print("保存失败")
            
        }else
        {
            
            print("保存成功")
        }
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
        
        itemSize = UIScreen.mainScreen().bounds.size
        
    }
}
