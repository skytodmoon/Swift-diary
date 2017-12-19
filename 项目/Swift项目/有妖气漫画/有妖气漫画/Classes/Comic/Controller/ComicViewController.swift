//
//  ComicViewController.swift
//  有妖气漫画
//
//  Created by 金亮齐 on 2017/12/15.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

protocol ComicViewWillEndDraggingDelegate: class {
    func comicWillEndDragging(_ scrollView: UIScrollView)
}

class ComicViewController: BaseViewController {
    
    private var comicid: Int = 0
    
    private lazy var mainScrollView: UIScrollView = {
        let sw = UIScrollView()
//        sw.delegate = self
        return sw
    }()
    
    private lazy var detailVC: DetailViewController = {
        let dc = DetailViewController()
//        dc.delegate = self
        return dc
    }()
    
    private lazy var chapterVC: ChapterViewController = {
        let cc = ChapterViewController()
//        cc.delegate = self
        return cc
    }()
    
    private lazy var navigationBarY: CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
    private lazy var commentVC: CommentViewController = {
        let cc = CommentViewController()
//        cc.delegate = self
        return cc
    }()
    
    private lazy var pageVC: PageViewController = {
        return PageViewController(titles: ["详情", "目录", "评论"],
                                   vcs: [detailVC, chapterVC, commentVC],
                                   pageStyle: .topTabBar)
    }()
    
    private lazy var headView: ComicHead = {
        return ComicHead(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: navigationBarY + 150))
    }()
    
    private var detailStatic: DetailStaticModel?
    private var detailRealtime: DetailRealtimeModel?
    
    
    convenience init(comicid: Int) {
        self.init()
        self.comicid = comicid
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        UIApplication.changeOrientationTo(landscapeRight: false)
        loadData()
    }
    private func loadData() {
        
        
    }
    
    override func configUI() {
        view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints {
            $0.edges.equalTo(self.view.usnp.edges).priority(.low)
            $0.top.equalToSuperview()
        }
        
        let contentView = UIView()
        mainScrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().offset(-navigationBarY)
        }
        
        addChildViewController(pageVC)
        contentView.addSubview(pageVC.view)
        pageVC.view.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        mainScrollView.parallaxHeader.view = headView
        mainScrollView.parallaxHeader.height = navigationBarY + 150
        mainScrollView.parallaxHeader.minimumHeight = navigationBarY
        mainScrollView.parallaxHeader.mode = .fill
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        navigationController?.barStyle(.clear)
        mainScrollView.contentOffset = CGPoint(x: 0, y: -mainScrollView.parallaxHeader.height)
    }
    
}
