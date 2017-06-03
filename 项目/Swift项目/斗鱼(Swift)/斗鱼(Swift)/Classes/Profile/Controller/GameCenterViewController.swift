//
//  GameCenterViewController.swift
//  斗鱼(Swift)
//
//  Created by 金亮齐 on 2017/6/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import MJRefresh

private let KGameCenterCellID = "KGameCenterCellID"

class GameCenterViewController: BaseViewController {
    fileprivate lazy var gameCenterVM = GameCenterViewModel()
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: MGScreenW, height: 95)
        flowLayout.minimumLineSpacing = MGGloabalMargin*0.5
        flowLayout.minimumInteritemSpacing = MGGloabalMargin
        flowLayout.sectionInset = UIEdgeInsets(top: MGGloabalMargin, left: MGGloabalMargin, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: self!.view.bounds, collectionViewLayout: flowLayout)
        cv.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cv.dataSource = self
        cv.delegate = self
        cv.register(GameCenterCell.self, forCellWithReuseIdentifier: KGameCenterCellID)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "游戏中心"
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UI
extension GameCenterViewController {
    override func setUpMainView() {
        contentView = collectionView
        view.addSubview(collectionView)
        super.setUpMainView()
    }
}

// MARK: - 数据
extension GameCenterViewController {
    fileprivate func loadData() {
        gameCenterVM.loadGameCenterData { (err) in
            if err == nil {
                self.collectionView.reloadData()
            }else {
                
            }
            self.loadDataFinished()
        }
    }
    
    fileprivate func setUpRefresh() {
        // MARK: - 下拉
        self.collectionView.mj_header = MJRefreshGifHeader(refreshingBlock: { [weak self]() -> Void in
            self!.gameCenterVM.gameCenterMmodels.removeAll()
            self?.loadData()
            self!.collectionView.mj_header.endRefreshing()
            self?.collectionView.mj_footer.endRefreshing()
        })
        self.collectionView.mj_header.isAutomaticallyChangeAlpha = true
        self.collectionView.mj_header.beginRefreshing()
    }
}


// MARK: - UICollectionViewDataSource
extension GameCenterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameCenterVM.gameCenterMmodels.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KGameCenterCellID, for: indexPath) as! GameCenterCell
        cell.model = gameCenterVM.gameCenterMmodels[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension GameCenterViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = gameCenterVM.gameCenterMmodels[indexPath.item]
        if UIApplication.shared.canOpenURL(URL(string: model.down_ios_url)!) {
            UIApplication.shared.openURL(URL(string: model.down_ios_url)!)
        }
    }
}
