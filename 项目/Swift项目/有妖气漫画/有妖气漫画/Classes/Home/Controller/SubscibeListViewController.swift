//
//  SubscibeListViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/12.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class SubscibeListViewController: BaseViewController {

    private lazy var collectionView: UICollectionView = {
        let lt = UCollectionViewSectionBackgroundLayout()
        lt.minimumInteritemSpacing = 5
        lt.minimumLineSpacing = 10
        let cw = UICollectionView(frame: CGRect.zero, collectionViewLayout: lt)
        cw.backgroundColor = UIColor.blue
//        cw.delegate = self
//        cw.dataSource = self
//        cw.alwaysBounceVertical = true
//        cw.register(cellType: ComicCCell.self)
//        cw.register(supplementaryViewType: ComicCHead.self, ofKind: UICollectionElementKindSectionHeader)
//        cw.register(supplementaryViewType: ComicCFoot.self, ofKind: UICollectionElementKindSectionFooter)
        cw.Head = RefreshHeader{ self.loadData() }
        cw.Foot = RefreshTipKissFooter(with: "使用妖气币可以购买订阅漫画\nVIP会员购买还有优惠哦~")
        cw.empty = EmptyView { self.loadData() }
        return cw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    private func loadData() {

    }
    
    override func configUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ $0.edges.equalTo(self.view.usnp.edges) }
    }

}
