//
//  RecommendViewController.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SafariServices

/** 轮播器的高度 */
private let kCycleViewH = kScreenW * 3 / 8
 /** 游戏View的高度 */
let kGameViewH : CGFloat = 90
/** item之间的间距 */
let kItemMargin : CGFloat = 10
/** item之间的间距 */
let kHeaderViewH : CGFloat = 30
/** item的宽度 */
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
/** 普通item的高度 */
let kNormalItemH = kNormalItemW * 3 / 4
/** 颜值的item的高度 */
let kPrettyItemH = kNormalItemW * 4 / 3

/** 普通item的循环利用标识符 */
let kNormalCellID = "kNormalCellID"
/** 颜值的item的循环利用标识符 */
let kPrettyCellID = "kPrettyCellID"
/** 每一组头部（section）的循环利用标识符 */
let kHeaderViewID = "kHeaderViewID"

class RecommendViewController: BaseViewController {
    
    var headerIndexPath: IndexPath?
    // MARK:- ViewModel
    fileprivate lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    
    
    // MARK:- 懒加载属性
    fileprivate lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView(frame: CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: kScreenW, height: kCycleViewH))
        return cycleView
    }()
    fileprivate lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        gameView.backgroundColor = UIColor.red
        return gameView
    }()
    
    fileprivate lazy var collectionView : UICollectionView = {[weak self] in
        // 1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        
        // 2.创建UICollectionView
        let collectionView = UICollectionView(frame: self!.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.scrollsToTop = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // 3.注册
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        return collectionView
    
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false

        loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - 初始化UI
extension RecommendViewController {
    
    override func setUpMainView()  {
        // 0.给ContentView进行赋值
        contentView = collectionView
        
        view.addSubview(collectionView)
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH + kGameViewH, left: 0, bottom: 0, right: 0)
        
        super.setUpMainView()
    }
}

// MARK: - 发送网络请求 loadData
extension RecommendViewController {
    fileprivate func loadData() {
        // 1.请求轮播数据
        recommendVM.requestCycleData {_ in
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
        
        // 2.请求推荐数据
        recommendVM.requestData { _ in
            // 1.展示推荐数据
            self.collectionView.reloadData()
            
            // 2.将数据传递给GameView
            var groups = self.recommendVM.anchorGroups
            
            // 2.1.移除前两组数据
            groups.removeFirst()
            groups.removeFirst()
            
            // 2.2.添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.icon_url = "home_more_btn"
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            
            self.gameView.groups = groups
            
            // 3.数据请求完成
            self.loadDataFinished()
        }
    }
}


// MARK: - UICollectionViewDataSource
extension RecommendViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return recommendVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath as NSIndexPath).section == 1 {
            // 1.取出PrettyCell
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            
            // 2.设置数据
            prettyCell.anchor = recommendVM.anchorGroups[(indexPath as NSIndexPath).section].anchors[(indexPath as NSIndexPath).item]
            
            return prettyCell
        } else {                    /// 其他组数据
            // 1.取出Cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
            
            // 2.给cell设置数据
            cell.anchor = recommendVM.anchorGroups[(indexPath as NSIndexPath).section].anchors[(indexPath as NSIndexPath).item]
            
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate
extension RecommendViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        }
}
