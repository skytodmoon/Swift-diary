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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeViewController {
    fileprivate func setUpMainView(){
        setUpNavgationBar()
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
