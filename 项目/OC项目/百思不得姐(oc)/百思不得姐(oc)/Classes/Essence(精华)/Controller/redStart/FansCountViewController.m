//
//  FansCountViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FansCountViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import <MJExtension/MJExtension.h>
#import "FansCountItem.h"
#import "FansCountViewCell.h"

static NSString *const ID = @"FansCounts";

@interface FansCountViewController ()
@property (nonatomic,strong) NSArray *FansCounts;
@end

@implementation FansCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FansCountViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
    self.tableView.rowHeight = 80;
    
    //取消TableView的分隔栏
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置内容的TableView的尺寸在滚动栏下
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, self.tabBarController.tabBar.sy_height, 0);
    
    [self reloadRefreshing];
}

- (void)reloadRefreshing{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData)];
    [self.tableView.mj_header beginRefreshing];
}

- (void)reloadData{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET: FansCountURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        [responseObject writeToFile:@"/Users/sunhaichao/Desktop/.plist" atomically:YES];
        self.FansCounts = [FansCountItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.FansCounts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FansCountViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.fansCount = self.FansCounts[indexPath.row];
    
    return cell;
}
@end
