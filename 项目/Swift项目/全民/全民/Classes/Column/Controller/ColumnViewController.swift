//
//  ColumnViewController.swift
//  全民
//
//  Created by 金亮齐 on 2017/9/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let kColumnItemMargin : CGFloat = 4
private let kItemW = (kScreenW - kColumnItemMargin * 4) / 3
private let kItemH = kScreenW / 2
private let kColumnCellID = "kColumnCellID"

class ColumnViewController: UIViewController {
    
    
    fileprivate lazy var ColumnArray = [ColumnModel]()
    fileprivate lazy var columnVM: ColumnVM = ColumnVM()
    
    /// 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = kColumnItemMargin
        layout.minimumInteritemSpacing = kColumnItemMargin
        layout.sectionInset = UIEdgeInsets(top: kColumnItemMargin, left: kColumnItemMargin, bottom: kColumnItemMargin, right: kColumnItemMargin)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.orange
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(UINib(nibName: "CollectionColumnCell", bundle: nil), forCellWithReuseIdentifier: kColumnCellID)
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
        columnVM.loadColumnData {
             self.collectionView.reloadData()
        }
    }
}

// MARK: - 遵守协议
extension ColumnViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return columnVM.columnArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kColumnCellID, for: indexPath) as! CollectionColumnCell
        cell.backgroundColor = UIColor.white
        cell.columnModel = columnVM.columnArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 点击cell 跳转控制器
//        let moreVC = MoreLivingVC()
//        let model = ColumnVM.ColumnArray[indexPath.item]
//        moreVC.cateName = model.ename
//        moreVC.title = model.cname
//        self.navigationController?.pushViewController(moreVC, animated: true)
    }
    
}

