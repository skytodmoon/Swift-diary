//
//  OAuthViewController.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "OAuthViewController.h"
#import "AFNetworking.h"
#import "Account.h"
#import "WeiboTool.h"
#import "AccountTool.h"
#import "FailLoadBtn.h"

@interface OAuthViewController ()<UIWebViewDelegate>
@property (nonatomic, weak) UIWebView *webView;
@property (nonatomic, weak) FailLoadBtn *failLoadBtn;
@end

@implementation OAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新浪账号授权";
    [self setupWebView];
    [self setupRefreshBtn];
    // Do any additional setup after loading the view.
}

// MARK: -  添加刷新按钮
- (void)setupRefreshBtn
{
    UIBarButtonItem *refreshBtn = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStyleBordered target:self action:@selector(refresh)];
    self.navigationItem.leftBarButtonItem = refreshBtn;
}


// MARK: - 刷新webView
- (void)refresh
{
    [self.webView reload];
}

//MARK: -  添加webView
- (void)setupWebView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    [self shouquan];
}

// MARK: -  发送授权请求
- (void)shouquan
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:OAuthAuthorizeURL]];
    [self.webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate method

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // HUD
    [SVProgressHUD setBackgroundColor:Color(246, 246, 246)];
    [SVProgressHUD showWithStatus:@"正在连接" maskType:SVProgressHUDMaskTypeClear];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // HUD
    [SVProgressHUD showSuccessWithStatus:@"连接成功"];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    self.failLoadBtn.hidden = YES;
    self.webView.hidden = NO;
    
    NSString *urlString = webView.request.URL.absoluteString;
    
    if ([urlString isEqualToString:OAuthAuthorizeURL]) {
        self.navigationItem.rightBarButtonItem = nil;
    } else {
        //MARK: - 添加一个返回授权按钮
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回授权" style:UIBarButtonItemStyleBordered target:self action:@selector(shouquan)];
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // HUD
    [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    self.failLoadBtn.hidden = NO;
    self.webView.hidden = YES;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{

    NSString *urlString = request.URL.absoluteString;
    NSRange range = [urlString rangeOfString:@"code="];
    
    if (range.length) {
        [self.webView removeFromSuperview];
        NSString *code = [urlString substringFromIndex:(range.location + range.length)];

        //MARK: - 给新浪发送POST请求获取access_token
        [self accessTokenWithCode:code];
    }
    
    return YES;
}


- (void)accessTokenWithCode:(NSString *)code{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:30];
    NSMutableDictionary *paramenters = [NSMutableDictionary dictionary];
    paramenters[@"client_id"] = @"1234171392";
    paramenters[@"client_secret"] = @"0cf8bc17a50102cd755c4cd85684c4a1";
    paramenters[@"grant_type"] = @"authorization_code";
    paramenters[@"code"] = code;
    paramenters[@"redirect_uri"] = @"http://www.baidu.com";
    [manager POST:OAuthAccessTokenURL parameters:paramenters progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //MARK: - 账号模型
        Account *account = [Account accountWithDict:responseObject];
        
        //MARK: - 存储账号模型
        [AccountTool saveAccount:account];
        
        //MARK: - 切换控制器: 新特征\首页
        [WeiboTool chooseRootViewController];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"登录失败"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        Log(@"请求失败: %@", error);
    }];
}
@end
