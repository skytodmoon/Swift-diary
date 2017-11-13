//
//  MeWebViewController.swift
//  百思不得姐
//
//  Created by 金亮齐 on 2017/11/13.
//  Copyright © 2017年 金亮齐. All rights reserved.
//

import UIKit

class MeWebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    var url: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        
        guard let u = URL(string: url) else {
            return
        }
        webView.loadRequest(URLRequest(url: u))
        
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func webBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    @IBAction func webForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    @IBAction func webRefresh(_ sender: UIBarButtonItem) {
        webView.reload()
    }

}

extension MeWebViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        
    }
    
}
