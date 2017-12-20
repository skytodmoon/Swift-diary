//
//  VIPListViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/12.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class VIPListViewController: BaseViewController {

    private lazy var collectionView: UICollectionView = {
        let lt = UCollectionViewSectionBackgroundLayout()
        lt.minimumInteritemSpacing = 5
        lt.minimumLineSpacing = 10
        let cw = UICollectionView(frame: CGRect.zero, collectionViewLayout: lt)
        cw.backgroundColor = UIColor.brown
//        cw.delegate = self
//        cw.dataSource = self
        cw.alwaysBounceVertical = true
//        cw.register(cellType: ComicCCell.self)
//        cw.register(supplementaryViewType: ComicCHead.self, ofKind: UICollectionElementKindSectionHeader)
//        cw.register(supplementaryViewType: ComicCFoot.self, ofKind: UICollectionElementKindSectionFooter)
        cw.Head = RefreshHeader{ self.loadData() }
        cw.Foot = RefreshTipKissFooter(with: "VIP用户专享\nVIP用户可以免费阅读全部漫画哦~")
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
