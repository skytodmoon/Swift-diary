//
//  ColumnViewController.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let kGameItemMargin : CGFloat = 4
private let kItemW = (kScreenW - kGameItemMargin * 4) / 3
private let kItemH = kScreenW / 2
private let kGameCellID = "kGameCellID"

class ColumnViewController: UIViewController {
    
    
    fileprivate lazy var gameArray = [ColumnModel]()
    fileprivate lazy var gameVM: ColumnVM = ColumnVM()
    
    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = kGameItemMargin
        layout.minimumInteritemSpacing = kGameItemMargin
        layout.sectionInset = UIEdgeInsets(top: kGameItemMargin, left: kGameItemMargin, bottom: kGameItemMargin, right: kGameItemMargin)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "CollectionColumnCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        return collectionView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        requestData()
        
        // Do any additional setup after loading the view.
    }
}

extension ColumnViewController {
    // MARK: - 设置UI内容
    fileprivate func setupUI() {
        view.addSubview(collectionView)
    }
    // MARK: - 发送网络请求
    fileprivate func requestData () {
        gameVM.loadGameData {
            self.collectionView.reloadData()
        }
    }
}


// MARK: - 遵守协议
extension ColumnViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.gameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionColumnCell
        cell.backgroundColor = UIColor.white
        cell.gameModel = gameVM.gameArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 点击cell 跳转控制器
//        let moreVC = MoreLivingVC()
//        let model = gameVM.gameArray[indexPath.item]
//        moreVC.cateName = model.ename
//        moreVC.title = model.cname
//        self.navigationController?.pushViewController(moreVC, animated: true)
    }
    
}

