//
//  VideoViewController.swift
//  今日头条
//
//  Created by 金亮齐 on 2017/9/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    fileprivate var startOffsetX: CGFloat = 0
    fileprivate var isForbidScroll: Bool = false
    var titles = [TopicTitle]()
    
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "VideoTopicViewCell")
        collectionView.isPagingEnabled = true
        collectionView.scrollsToTop = false
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        self.RequestData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

// MARK: - setupUI
extension VideoViewController {
    // 设置 UI
    fileprivate func setupUI() {
        view.backgroundColor = UIColor.globalBackgroundColor()
        // 设置导航栏颜色
        navigationController?.navigationBar.theme_barTintColor = "colors.otherNavBarTintColor"
        navigationController?.navigationBar.shadowImage = UIImage()
        view.addSubview(collectionView)
    }
}

extension VideoViewController {
    fileprivate func RequestData() {
        NetworkTool.loadVideoTitlesData { (videoTitles, videoTopicVCs) in
            self.titles = videoTitles
            
            for childVC in videoTopicVCs {
                self.addChildViewController(childVC)
            }
            self.collectionView.reloadData()
        }
    }
    
}

extension VideoViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width, height: collectionView.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childViewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoTopicViewCell", for: indexPath)
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        let childVc = childViewControllers[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        return cell
    }
}


// MARK:- UICollectionView的delegate
extension VideoViewController : UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        contentEndScroll()
        scrollView.isScrollEnabled = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            contentEndScroll()
        } else {
            scrollView.isScrollEnabled = false
        }
    }
    
    private func contentEndScroll() {
//        // 获取滚动到的位置
//        let currentIndex = Int(collectionView.contentOffset.x / collectionView.bounds.width)
//        // 通知titleView进行调整
//        delegate?.videoViewController(self, targetIndex: currentIndex)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isForbidScroll = false
        startOffsetX = scrollView.contentOffset.x
    }
}
