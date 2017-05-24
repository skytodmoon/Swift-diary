//
//  webViewController.swift
//  ofo(小黄)
//
//  Created by 金亮齐 on 2017/5/24.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//
import UIKit
import WebKit

class webViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    //MARK: - 设置webView
    private func setupUI(){
    
        webView = WKWebView(frame: self.view.frame)
        
        view.addSubview(webView)
        self.title = "热门活动"
        let url = URL(string: "http://m.ofo.so/active.html")!
        let request = URLRequest(url: url)
        
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
