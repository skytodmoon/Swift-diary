//
//  OAuthViewController.swift
//  微博
//
//  Created by 金亮齐 on 2017/5/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

/*
 请求授权	oauth2/authorize	
 请求用户授权Token oauth2/authorize
 OAuth2的authorize接口
 URL
 https://api.weibo.com/oauth2/authorize
 HTTP请求方式
 GET/POST
 请求参数
 必选	类型及范围	说明
 client_id	true	string	申请应用时分配的AppKey。
 redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
 scope	false	string	申请scope权限所需参数，可一次申请多个scope权限，用逗号分隔。使用文档
 state	false	string	用于保持请求和回调的状态，在回调时，会在Query Parameter中回传该参数。开发者可以用这个参数验证请求有效性，也可以记录用户请求授权页前的位置。这个参数可用于防止跨站请求伪造（CSRF）攻击
 display	false	string	授权页面的终端类型，取值见下面的说明。
 forcelogin	false	boolean	是否强制用户重新登录，true：是，false：否。默认false。
 language	false	string	授权页语言，缺省为中文简体版，en为英文版。英文版测试中，开发者任何意见可反馈至 @微博API
 
 display说明：
 参数取值	类型说明
 default	默认的授权页面，适用于web浏览器。
 mobile	移动终端的授权页面，适用于支持html5的手机。注：使用此版授权页请用 https://open.weibo.cn/oauth2/authorize 授权接口
 wap	wap版授权页面，适用于非智能手机。
 client	客户端版本授权页面，适用于PC桌面应用。
 apponweibo	默认的站内应用授权页，授权后不返回access_token，只刷新站内应用父框架。
 返回数据
 返回值字段	字段类型	字段说明
 code	string	用于第二步调用oauth2/access_token接口，获取授权后的access token。
 state	string	如果传递参数，会回传该参数。
 示例
 //请求
 https://api.weibo.com/oauth2/authorize?client_id=123050457758183&redirect_uri=http://www.example.com/response&response_type=code
 
 //同意授权后会重定向
 http://www.example.com/response&code=CODE
 */

import UIKit
import Alamofire

class OAuthViewController: UIViewController {
    
    let App_key = "1234171392"
    let App_Secret = "0cf8bc17a50102cd755c4cd85684c4a1"
    let App_Redirect_Url = "www.baidu.com"
    
    override func loadView() {
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "醉看红尘这场梦"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "关闭",style: .Plain, target: self,action: #selector(OAuthViewController.close))
        //MARK: - 拼接授权地址
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=\(App_key)&redirect_uri=\(App_Redirect_Url)"
        let url = NSURL(string: urlStr)
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        // Do any additional setup after loading the view.
    }
    
    func close() {
        dismissViewControllerAnimated(true, completion: nil)
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
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.URL!.absoluteString.hasPrefix(App_Redirect_Url+"/?code="){
            let arr = request.URL?.query?.componentsSeparatedByString("=")
            loadAccessToken(arr!.last!)
            return false
        }
        
        return true
    }
    
    /*
     
     URL
     https://api.weibo.com/oauth2/access_token
     HTTP请求方式
     POST
     请求参数
     必选	类型及范围	说明
     client_id	true	string	申请应用时分配的AppKey。
     client_secret	true	string	申请应用时分配的AppSecret。
     grant_type	true	string	请求的类型，填写authorization_code
     
     grant_type为authorization_code时
     必选	类型及范围	说明
     code	true	string	调用authorize获得的code值。
     redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
     
     返回数据
     {
     "access_token": "ACCESS_TOKEN",
     "expires_in": 1234,
     "remind_in":"798114",
     "uid":"12341234"
     }
     
     返回值字段	字段类型	字段说明
     access_token	string	用户授权的唯一票据，用于调用微博的开放接口，同时也是第三方应用验证微博用户登录的唯一票据，第三方应用应该用该票据和自己应用内的用户建立唯一影射关系，来识别登录状态，不能使用本返回值里的UID字段来做登录识别。
     expires_in	string	access_token的生命周期，单位是秒数。
     remind_in	string	access_token的生命周期（该参数即将废弃，开发者请使用expires_in）。
     uid	string	授权用户的UID，本字段只是为了方便开发者，减少一次user/show接口调用而返回的，第三方应用不能用此字段作为用户登录状态的识别，只有access_token才是用户授权的唯一票据。
     */
    //MARK: - 获取授权	oauth2/access_token	获取授权过的Access Token
    private func loadAccessToken(code: String) {
        
        let parameters = ["client_id" : App_key, "client_secret" : App_Secret, "grant_type" : "authorization_code", "code" : "code", "redirect_uri" : App_Redirect_Url]
        Alamofire.request(.POST, "https://api.weibo.com/oauth2/access_token", parameters: parameters, encoding: .URL, headers: nil).responseJSON { (Response) -> Void in

            let account = UserAccount(dict:Response.result.value as! [String: AnyObject])
            account.loadUserInfo { (account, error) -> () in
                if account != nil
                {
                    account!.saveAccount()

                    NSNotificationCenter.defaultCenter().postNotificationName( SwitchRootViewControllerKey, object: false)
                }
            }
        }
    }
}
