//
//  EmoticonView.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let kEmoticonCellID = "kEmoticonCellID"
private let kEdgeMargin : CGFloat = 10

class EmoticonView: UIView {

    var emoticonClickCallBack: ((EmoticonModel) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: setupUI
extension EmoticonView {
    fileprivate func setupUI() {
        
        let style = TitleStyle()
        style.isShowBottomLine = true
        style.isScrollEnable = false
        
        let layout = LivePageCollectionViewLayout()
        layout.cols = 7
        layout.rows = 3
        layout.sectionInset = UIEdgeInsets(top: kEdgeMargin, left: kEdgeMargin, bottom: kEdgeMargin, right: kEdgeMargin)
        
        let pageView = LivePageCollectionView(frame: self.bounds, titles: ["普通","粉丝专属"], style: style, isTitleInTop: false, layout: layout)
        
        // 注册 cell
        pageView.register(nib: UINib(nibName: "EmoticonViewCell", bundle: nil), identifier: kEmoticonCellID)
        
        addSubview(pageView)
        
        // 设置 pageView 的属性
        pageView.dataSource = self
        pageView.delegate = self
        
    }
}
// MARK: PageCollectionViewDataSource
extension EmoticonView: LivePageCollectionViewDataSource {
    
    func numberOfSections(in pageCollectionView: LivePageCollectionView) -> Int {
        return EmoticonViewModel.shareInstance.packages.count
    }
    func pageCollectionView(_ collectionView: LivePageCollectionView, numberOfItemsInSection section: Int) -> Int {
        return EmoticonViewModel.shareInstance.packages[section].emoticons.count
        
    }
    func pageCollectionView(_ pageCollectionView: LivePageCollectionView, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kEmoticonCellID, for: indexPath) as! EmoticonViewCell
        cell.emoticon = EmoticonViewModel.shareInstance.packages[indexPath.section].emoticons[indexPath.item]
        
        
        return cell
    }
}

// MARK: PageCollectionViewDelegate
extension EmoticonView : LivePageCollectionViewDelegate {
    
    func pageCollectionView(_ pageCollectionView: LivePageCollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 取出每个 cell 的模型 ,然后将模型传递给 ChatToolsView (通过闭包)
        let emoticon = EmoticonViewModel.shareInstance.packages[indexPath.section].emoticons[indexPath.item]
        // 将闭包传出去
        if let emoticonClickCallBack = emoticonClickCallBack {
            emoticonClickCallBack(emoticon)
        }
        
    }
}
