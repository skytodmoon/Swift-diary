//
//  BuyDetailViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class BuyDetailViewController: UIViewController {

    private lazy var webView: UIWebView = {
        let web = UIWebView(frame: CGRectMake(0, 0, AppWidth, AppHeight - NavigationH))
        web.backgroundColor = theme.SDBackgroundColor
        web.scrollView.showsHorizontalScrollIndicator = false
        return web
    }()
    
    var htmlStr: String? {
        didSet {
            let newStr = NSMutableString.changeHeigthAndWidthWithSrting(NSMutableString(string: htmlStr!))
            self.webView.loadHTMLString(newStr as String, baseURL: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "购买须知"
        
        view.addSubview(webView)
    }


}
