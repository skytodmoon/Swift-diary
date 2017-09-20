//
//  MainViewController.swift
//  优点巴士
//
//  Created by 金亮齐 on 2017/9/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import SWRevealViewController

private let kTitleViewH : CGFloat = 40

class MainViewController: SWRevealViewController {
    
    
    // MARK:- 懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: ScreenW, height: kTitleViewH)
        let titles = ["班车", "公交", "城际", "地图"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
        }()
    
    fileprivate lazy var pageContentView : PageContentView = {[weak self] in
        
        // 1.确定内容的frame
        let contentH = ScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: ScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()

        let vc = UIViewController()
        childVcs.append(BusViewController())
        childVcs.append(TransitViewController())
        childVcs.append(CityViewController())
        childVcs.append(CharteredViewController())
        
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpMainView()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
// MARK: - 初始化UI
extension MainViewController {
    
    fileprivate func setUpMainView() {
        self.title = "优点巴士"
        
        let revealController = self.getRevealViewController()
        revealController.rearViewRevealWidth = ScreenW*0.82
        view.addGestureRecognizer(revealController.panGestureRecognizer())
        view.addGestureRecognizer(revealController.tapGestureRecognizer())
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_home_Nav_left").withRenderingMode(.alwaysOriginal), style: .plain, target: revealController, action: #selector(revealController.revealToggle(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_home_Nav_right").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(MainViewController.rightClick))
        
        // 0.不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        view.backgroundColor = UIColor.white
        
        // 2.添加TitleView
        view.addSubview(pageTitleView)
        
        // 3.添加ContentView
        view.addSubview(pageContentView)
    }
    
    @objc fileprivate func leftClick() {
        self.revealViewController().revealToggle(nil)
    }
    @objc fileprivate func rightClick(_ btn: UIButton) {
        let messageVC = MessageController()
        navigationController?.pushViewController(messageVC, animated: true)
    }
}


// MARK:- 遵守PageTitleViewDelegate协议
extension MainViewController : PageTitleViewDelegate {
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(index)
    }
}


// MARK:- 遵守PageContentViewDelegate协议
extension MainViewController : PageContentViewDelegate {
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
