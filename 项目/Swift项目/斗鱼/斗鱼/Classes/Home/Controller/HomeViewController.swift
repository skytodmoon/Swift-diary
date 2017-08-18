//
//  HomeViewController.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let kTitlesViewH : CGFloat = 40

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false;
        
        setUpMainView()
        // Do any additional setup after loading the view.
    }

    fileprivate lazy var homeTitlesView: HomeTitlesView = { [weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitlesViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let tsView = HomeTitlesView(frame: titleFrame, titles: titles)
        tsView.deledate = self
        return tsView
        }()
    fileprivate lazy var homeContentView: HomeContentView = { [weak self] in
        // 1.确定内容的frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitlesViewH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH+kTitlesViewH, width: kScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        childVcs.append(GameViewController())
        childVcs.append(AmuseViewController())
        childVcs.append(FunnyViewController())
        let contentView = HomeContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
        }()
}

extension HomeViewController {
    fileprivate func setUpMainView(){
        setUpNavgationBar()
        view.addSubview(homeTitlesView)
        view.addSubview(homeContentView)
    }
    fileprivate func setUpNavgationBar() {
        // 1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem.createItem("logo")
        
        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size, target: self, action: #selector(self.historyClick(_:)))
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size, target: self, action: #selector(HomeViewController.seachClick(_:)))
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size, target: self, action: #selector(self.scanClick(btn:)))
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
    
    @objc fileprivate func historyClick(_ btn: UIButton) {
        
    }
    
    // 搜索
    @objc fileprivate func seachClick(_ btn: UIButton) {
        
    }
    
    // 扫一扫
    @objc fileprivate func scanClick(btn: UIButton) {
        self.show(QQScanViewController(), sender: nil)
    }
}
// MARK:- 遵守 HomeTitlesViewDelegate 协议
extension HomeViewController : HomeTitlesViewDelegate {
    func HomeTitlesViewDidSetlected(_ homeTitlesView: HomeTitlesView, selectedIndex: Int) {
        homeContentView.setCurrentIndex(selectedIndex)
    }
}
// MARK:- 遵守 HomeContentViewDelegate 协议
extension HomeViewController : HomeContentViewDelegate {
    func HomeContentViewDidScroll(_ contentView: HomeContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        homeTitlesView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}



