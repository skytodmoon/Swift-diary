//
//  SearchCCell.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class SearchCCell: BaseCollectionViewCell {
    lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.textAlignment = .center
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.textColor = UIColor.darkGray
        return tl
    }()
    override func configUI() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.background.cgColor
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { $0.edges.equalToSuperview().inset(UIEdgeInsetsMake(10, 20, 10, 20)) }
    }
}

typealias SearchTFootDidSelectIndexClosure = (_ index: Int, _ model: SearchItemModel) -> Void

protocol SearchTFootDelegate: class {
    func searchTFoot(_ searchTFoot: SearchTFoot, didSelectItemAt index: Int, _ model: SearchItemModel)
}

class SearchTFoot: BaseTableViewHeaderFooterView {
    
    weak var delegate: SearchTFootDelegate?
    
    private var didSelectIndexClosure: SearchTFootDidSelectIndexClosure?
    
    private lazy var collectionView: UICollectionView = {
        let lt = UCollectionViewAlignedLayout()
        lt.minimumInteritemSpacing = 10
        lt.minimumLineSpacing = 10
        lt.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        lt.horizontalAlignment = .left
        lt.estimatedItemSize = CGSize(width: 100, height: 40)
        let cw = UICollectionView(frame: CGRect.zero, collectionViewLayout: lt)
        cw.backgroundColor = UIColor.white
        cw.dataSource = self
        cw.delegate = self
        cw.register(cellType: SearchCCell.self)
        return cw
    }()
    
    var data: [SearchItemModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func configUI() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
}

extension SearchTFoot: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: SearchCCell.self)
        cell.layer.cornerRadius = cell.bounds.height * 0.5
        cell.titleLabel.text = data[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.searchTFoot(self, didSelectItemAt: indexPath.row, data[indexPath.row] )
        
        guard let closure = didSelectIndexClosure else { return }
        closure(indexPath.row, data[indexPath.row])
    }
    
    func didSelectIndexClosure(_ closure: @escaping SearchTFootDidSelectIndexClosure) {
        didSelectIndexClosure = closure
    }
}

