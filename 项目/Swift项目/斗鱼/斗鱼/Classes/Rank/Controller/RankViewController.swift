//
//  RankViewController.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class RankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        setupUI()
        
        // Do any additional setup after loading the view.
    }

}

extension RankViewController {
    fileprivate func setupUI() {
        let rect = CGRect(x: 0, y: kStatusBarH, width: kScreenW, height: kScreenH - kStatusBarH)
        
        let titles = ["明星榜","富豪榜","人气榜","周星榜"]
        
        let style = TitleStyle()
        style.isShowBottomLine = true
        style.isScrollEnable = false
        
        var childVCs = [SubbankViewController]()
        for i in 0..<titles.count {
            
            let vc = i == 3 ? WeeklyRankViewController() : NomalRankViewController()
            vc.currentIndex = i
            childVCs.append(vc)
            
        }
        
        let scrollPageView = LiveScrollPageView(frame: rect, titles: titles, style: style, childVcs: childVCs, parentVc: self)
        
        view.addSubview(scrollPageView)
    }
}
