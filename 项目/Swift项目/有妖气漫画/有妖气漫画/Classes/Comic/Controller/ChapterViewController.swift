//
//  ChapterViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/18.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class ChapterViewController: BaseViewController {
    
    private var isPositive: Bool = true
    
    var detailStatic: DetailStaticModel?
    var detailRealtime: DetailRealtimeModel?
    
    weak var delegate: ComicViewWillEndDraggingDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: floor((screenWidth - 30) / 2), height: 40)
        let cw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cw.backgroundColor = UIColor.red
//        cw.delegate = self
//        cw.dataSource = self
        cw.alwaysBounceVertical = true
//        cw.register(supplementaryViewType: ChapterCHead.self, ofKind: UICollectionElementKindSectionHeader)
//        cw.register(cellType: ChapterCCell.self)
        return cw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    override func configUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {$0.edges.equalTo(self.view.usnp.edges) }
    }

}
