//
//  SendStatusViewController.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SendStatusViewController.h"
#import "AFNetworking.h"
#import "AccountTool.h"
#import "Account.h"
#import "SVProgressHUD.h"


@interface SendStatusViewController ()<UITextViewDelegate>

/** 新微博输入框 */
@property (nonatomic, weak) UITextView *inputView;
/** 发送按钮 */
@property (nonatomic, weak) UIBarButtonItem *rightBtn;

@end

@implementation SendStatusViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.inputView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置导航栏按钮
    [self setupBarButtonItem];
    
    // 设置文本框
    [self setupInputView];
}

/**
 *  设置文本框
 */
- (void)setupInputView
{
    UITextView *inputView = [[UITextView alloc] init];
    inputView.delegate = self;
    inputView.frame = self.view.bounds;
    inputView.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:inputView];
    self.inputView = inputView;
    
    [self textViewDidChange:inputView];
}

/**
 *  设置导航栏按钮
 */
- (void)setupBarButtonItem
{
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleBordered target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem = right;
    self.rightBtn = right;
}

/**
 *  取消
 */
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发送
 */
- (void)send{
    
    [SVProgressHUD showWithStatus:@"正在发送" maskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setBackgroundColor:Color(246, 246, 246)];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.view endEditing:YES];

    NSString *newStatus = self.inputView.text;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:30];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json", nil];
    NSMutableDictionary *pars = [NSMutableDictionary dictionary];
    pars[@"access_token"] = [AccountTool account].access_token;
    pars[@"status"] = newStatus;
    [manager POST:UpdateStatus parameters:pars progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"发送成功"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        Log(@"error: %@", error.localizedDescription);
    }];
}

#pragma mark - UITextViewDelegate Method

- (void)textViewDidChange:(UITextView *)textView
{
    self.rightBtn.enabled = textView.text.length > 0;
}

@end
