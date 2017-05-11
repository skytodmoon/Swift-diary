//
//  HomeViewController.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeViewController.h"
#import "Account.h"
#import "AccountTool.h"
#import "Status.h"
#import "TitleButton.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "AccountTool.h"
#import "Account.h"
#import "Status.h"
#import "User.h"
#import "StatusCell.h"
#import "StatusFrame.h"
#import "SVProgressHUD.h"
#import "MJRefresh.h"

@interface HomeViewController ()
@property (nonatomic, assign, getter = isTitleOpen) BOOL titleOpen;
@property (nonatomic, strong) NSMutableArray *statusFrames;
@end

@implementation HomeViewController

- (NSMutableArray *)statusFrames
{
    if (_statusFrames == nil) {
        _statusFrames = [NSMutableArray array];
    }
    return _statusFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavigationBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 设置NavigationBar
- (void)setupNavigationBar
{
    // 设置左右item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) imageName:@"navigationbar_friendsearch" highlightedImageName:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) imageName:@"navigationbar_pop" highlightedImageName:@"navigationbar_pop_highlighted"];
    
    // 设置中间button
    TitleButton *titleButton = [TitleButton titleButton];
    NSString *title = @"小小微博";
    [titleButton setTitle:title forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    
    CGSize titleSize = [title sizeWithFontSize:TitleButtonSize];
    titleButton.bounds = CGRectMake(0, 0, titleSize.width + titleButton.imageView.bounds.size.width + 5, 30);
    [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
}

// 查找好友
- (void)friendSearch
{
    Log(@"小小微博--friendSearch");
}

// 扫一扫
- (void)pop
{
    Log(@"小小微博--pop");
}


// 监听中间标题按钮的点击
- (void)titleButtonClick:(TitleButton *)button
{
    self.titleOpen = !self.isTitleOpen;
    
    UIImage *image = [UIImage imageNamed:self.isTitleOpen ? @"navigationbar_arrow_up" : @"navigationbar_arrow_down"];
    [button setImage:image forState:UIControlStateNormal];
}

//MARK: - 下拉刷新

- (void)headerRereshing{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:30];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json", nil];
    NSMutableDictionary *pars = [NSMutableDictionary dictionary];
    pars[@"access_token"] = [AccountTool account].access_token; // 用户token
    pars[@"count"] = @20; // 每页微博个数
//    if (self.statusFrames.count) {
//        Status *status = [self.statusFrames[0] status];
//        pars[@"since_id"] = status.idstr; // 加载ID比since_id大的微博
//    }
    [manager POST:HomeStatus parameters:pars progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"刷新成功"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        Log(@"请求失败: %@", error);
    }];

}

@end
