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
    [self setupRefresh];
    [self setupNavigationBar];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = Color(226, 226, 226);
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, StatusPadding * 0.5, 0);
    // Do any additional setup after loading the view.
}

/**
 *  设置刷新
 */
- (void)setupRefresh
{
    // 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    [self.tableView.mj_header beginRefreshing];

    // 上拉加载
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];

}

/**
 *  上拉加载
 */
- (void)footerRereshing
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:30];
    NSMutableDictionary *pars = [NSMutableDictionary dictionary];
    pars[@"access_token"] = [AccountTool account].access_token; // 用户token
    pars[@"count"] = @20; // 每页微博个数
    if (self.statusFrames.count) {
        Status *status = [[self.statusFrames lastObject] status];
        long long maxId = [status.idstr longLongValue] - 1;
        pars[@"max_id"] = @(maxId);
    }
    
    [manager GET:HomeStatus parameters:pars progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.tableView.mj_footer endRefreshing];
        
        NSArray *statusArray = [Status mj_objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (Status *status in statusArray) {
            StatusFrame *statusFrame = [[StatusFrame alloc] init];
            statusFrame.status = status;
            [statusFrameArray addObject:statusFrame];
        }
        
        [self.statusFrames addObjectsFromArray:statusFrameArray];
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.tableView.mj_footer endRefreshing];
        
        Log(@"error: %@", error.localizedDescription);
    }];
    
}

// 显示新微博数量
- (void)showNewStatusCount:(int)count
{
    UIButton *btn = [[UIButton alloc] init];
    btn.userInteractionEnabled = NO;
    [btn setBackgroundImage:[UIImage resizedImageWithName:@"timeline_new_status_background"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    NSString *title = nil;
    if (count) {
        title = [NSString stringWithFormat:@"%d条新微博", count];
        [btn setTitle:title forState:UIControlStateNormal];
    } else {
        [btn setTitle:@"没有新微博" forState:UIControlStateNormal];
    }
    
    CGFloat btnX = 0;
    CGFloat btnH = 30;
    CGFloat btnW = self.view.bounds.size.width;
    CGFloat btnY = 64 - btnH;
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    [self.navigationController.view insertSubview:btn belowSubview:self.navigationController.navigationBar];
    
    [UIView animateWithDuration:0.7 animations:^{
        btn.transform = CGAffineTransformMakeTranslation(0, btnH);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.7
                              delay:1
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             btn.transform = CGAffineTransformIdentity;
                         }
                         completion:^(BOOL finished) {
                             [btn removeFromSuperview];
                         }];
    }];
}

// 设置NavigationBar
- (void)setupNavigationBar{
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
    NSMutableDictionary *pars = [NSMutableDictionary dictionary];
    pars[@"access_token"] = [AccountTool account].access_token; // 用户token
    pars[@"count"] = @20; // 每页微博个数
    if (self.statusFrames.count) {
        Status *status = [self.statusFrames[0] status];
        pars[@"since_id"] = status.idstr; // 加载ID比since_id大的微博
    }
    [manager POST:HomeStatus parameters:pars progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"刷新成功"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.tableView.mj_header beginRefreshing];
        
        NSArray *statusArray = [Status mj_objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (Status *status in statusArray) {
            StatusFrame *statusFrame = [[StatusFrame alloc] init];
            statusFrame.status = status;
            [statusFrameArray addObject:statusFrame];
        }
        
        NSMutableArray *tempArray = [NSMutableArray array];
        [tempArray addObjectsFromArray:statusFrameArray];
        [tempArray addObjectsFromArray:self.statusFrames];
        self.statusFrames = tempArray;
        
        [self.tableView reloadData];
        if (statusFrameArray.count) {
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
        
        // 显示新微博数量
        [self showNewStatusCount:(int)statusFrameArray.count];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.tableView.mj_header endRefreshing];
        Log(@"请求失败: %@", error);
    }];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusCell *cell = [StatusCell cellWithTableView:tableView];
    
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.statusFrames[indexPath.row] cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
