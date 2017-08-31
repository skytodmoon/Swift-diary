//
//  QJLWebViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class QJLWebViewController: UIViewController {

    var webView = UIWebView.init()
    
    var url:URLRequest?{
        didSet{
            self.webView.loadRequest(url! as URLRequest)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = self.view.bounds
        self.view.addSubview(webView)
        
        
    }

}
