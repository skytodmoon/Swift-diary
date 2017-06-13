//
//  WebViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航条右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"comment_nav_item_share_icon" hightImage:@"comment_nav_item_share_icon_click" target:self action:@selector(share)];
    
    //创建一个WKWebView
    WKWebView *webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 64, ScreenW, ScreenH)];
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    
    [self.webView addSubview:webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:_url];
    [webView loadRequest:request];
    // Do any additional setup after loading the view from its nib.
}

- (void)share{
    LogFunc
}

@end
