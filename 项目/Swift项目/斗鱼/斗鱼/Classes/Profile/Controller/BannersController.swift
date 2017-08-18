//
//  BannersController.swift
//  斗鱼
//
//  Created by 金亮齐 on 2017/8/18.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class BannersController: UIViewController {

    /// webView
    fileprivate lazy var webView : UIWebView = UIWebView()
    
    var urlString : String?
    var titleString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = (titleString ?? "")
        
        print(urlString ?? "")
        webView.frame = view.bounds
        webView.backgroundColor = UIColor.white
        view.addSubview(webView)
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
}

// MARK: --  加载数据
extension BannersController {
    fileprivate func loadData() {
        print(urlString ?? "")
        let url = URL(string: urlString!)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
}
