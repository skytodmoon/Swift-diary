//
//  QJLWebViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/23.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class QJLWebViewController: UIViewController {

    var webView = UIWebView.init()
    
    var url:NSURLRequest?{
        didSet{
            self.webView.loadRequest(url!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = self.view.bounds
        self.view.addSubview(webView)
        
        
    }

}
