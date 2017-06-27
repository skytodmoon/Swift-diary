//
//  RecommendViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/2/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController {
    
    private lazy var webView: UIWebView! = {
        let webView = UIWebView(frame: MainBounds)
        let url = NSURL(string: "http://www.jianshu.com/u/ef13bae228f6")!
        webView.loadRequest(NSURLRequest(URL: url))
        webView.delegate = self
        return webView
    }()
    
    private let loadAnimatIV: LoadAnimatImageView! = LoadAnimatImageView.sharedManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "应用推荐"
        view.backgroundColor = theme.SDWebViewBacagroundColor
        view.addSubview(webView)
    }

}
    
    extension RecommendViewController: UIWebViewDelegate {
        
        func webViewDidStartLoad(webView: UIWebView) {
            loadAnimatIV.startLoadAnimatImageViewInView(view, center: view.center)
        }
        
        func webViewDidFinishLoad(webView: UIWebView) {
            loadAnimatIV.stopLoadAnimatImageView()
        }
        
}