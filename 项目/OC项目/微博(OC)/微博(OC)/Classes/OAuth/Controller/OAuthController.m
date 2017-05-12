//
//  OAuthController.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "OAuthController.h"
#import "AccountTool.h"
#import "Account.h"

@interface OAuthController ()<UIWebViewDelegate>

@end

@implementation OAuthController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]init];
    webView.delegate = self;
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=1234171392&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    // Do any additional setup after loading the view.
}

//隐藏状态栏
-(BOOL)prefersStatusBarHidden {
    
    return YES;
}

#pragma mark-webView的代理方法


-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    //获得Url
    NSString *url = request.URL.absoluteString;
    
    //判断是否为回调地址
    NSRange range = [url rangeOfString:@"code="];
    
    if (range.length != 0) {
        //截取code=后面的参数
        int fromIndex = (int)(range.location + range.length);
        NSString *code = [url substringFromIndex:fromIndex];
        
        // 利用code换取一个accessToken
        [self accessTokenWithCode:code];
        
        //禁止加载回调页面
        return NO;
    }
    
    return YES;
}

- (void)accessTokenWithCode:(NSString *)code{
    
        NSString *url = @"https://api.weibo.com/oauth2/access_token";
        AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
        //拼接请求参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"client_id"] = @"1234171392";
        params[@"client_secret"] = @"0cf8bc17a50102cd755c4cd85684c4a1";
        params[@"grant_type"] = @"authorization_code";
        params[@"redirect_uri"] = @"http://www.baidu.com";
        params[@"code"] = code;
    
        [mgr GET:url parameters:mgr progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"请求成功");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            // 将返回的账号字典数据 --> 模型，存进沙盒
            Account *account = [Account accountWithDict:responseObject];
            //储存账号信息
            [AccountTool saveAccount:account];
            
            // 切换窗口的根控制器
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            [window switchRootViewController];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"失========败%@",error);
        }];
}

@end
