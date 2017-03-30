//
//  ExperHeadPushViewController.swift
//  小日子
//
//  Created by 金亮齐 on 2017/3/30.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ExperHeadPushViewController: UIViewController {
    
    var model:ExperienceHeadModel? {
        didSet {
            webView?.loadRequest(NSURLRequest(URL: NSURL(string: model!.mobileURL!)!))
            navigationItem.title = model!.title
            shareView.shareModel = ShareModel(shareTitle: model!.title, shareURL: model!.shareURL, image: nil, shareDetail: model!.title)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = theme.SDBackgroundColor
        view.addSubview(webView!)
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "share_1", highlImageName: "share_2", targer: self, action: #selector(ExperHeadPushViewController.sharedClick))
    }

    /// MARK:- 懒加载对象
    private lazy var webView: UIWebView? = {
        let webView = UIWebView(frame: MainBounds)
        webView.delegate = self
        webView.backgroundColor = theme.SDBackgroundColor
        webView.hidden = true
        return webView
    }()
    
    private lazy var shareView: ShareView = {
        let shareView = ShareView.shareViewFromXib()
        return shareView
    }()
    
    private lazy var loadImage = LoadAnimatImageView.sharedManager
    
    func sharedClick() {
        view.addSubview(shareView)
        shareView.shareVC = self
        shareView.showShareView(CGRectMake(0, AppHeight - 215 - NavigationH, AppWidth, 215))
    }
}

extension ExperHeadPushViewController: UIWebViewDelegate {
    func webViewDidStartLoad(webView: UIWebView) {
        loadImage.startLoadAnimatImageViewInView(view, center: view.center)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webView.hidden = false
        loadImage.stopLoadAnimatImageView()
        webView.scrollView.contentSize.height += NavigationH
    }
}
