//
//  OAuthViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/8/29.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

import UIKit
import Alamofire
import PKHUD

class OAuthViewController: UIViewController {
    
    let App_Key = "1234171392"
    let App_Secret = "0cf8bc17a50102cd755c4cd85684c4a1"
    let App_Redirect_Uri = "http://www.baidu.com"
    
    override func loadView() {
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "醉看红尘这场梦"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "关闭",style: .plain, target: self,action: #selector(OAuthViewController.close))
        //MARK: - 拼接授权地址
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=\(App_Key)&redirect_uri=\(App_Redirect_Uri)"
        let url = NSURL(string: urlStr)
        let request = URLRequest(url: url! as URL)
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }

    func close() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - 懒加载webView
    private lazy var webView: UIWebView = {
        let webView = UIWebView()
        webView.delegate = self
        return webView
    }()

}

//MARK: - UIWebViewDelegate
extension OAuthViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.url!.absoluteString.hasPrefix(App_Redirect_Uri+"/?code="){
            let arr = request.url?.query?.components(separatedBy: "=")
            loadAccessToken(code: (arr?.last)!)
            return false
        }
        
        return true
    }

    private func loadAccessToken(code: String) {
        let parameters = ["client_id":App_Key,"client_secret":App_Secret,"grant_type":"authorization_code","code":code,"redirect_uri":App_Redirect_Uri]
        
        Alamofire.request("https://api.weibo.com/oauth2/access_token", method: .post, parameters: parameters).responseJSON { (response) in
            let account = UserAccount(dict:response.result.value as! [String: AnyObject])
                account.loadUserInfo { (account, error) -> () in
                    if account != nil
                    {
                    
                        account!.saveAccount()
                        NotificationCenter.default.post( name: NSNotification.Name(rawValue: SwitchRootViewControllerKey), object: false)
                }
            }
        }
    }
}
