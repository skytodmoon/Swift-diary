//
//  FansFastestViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FansFastestViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJRefresh/MJRefresh.h>
#import <MJExtension/MJExtension.h>
#import "FansFastestItems.h"
#import "FansFastestCell.h"

static NSString *const ID = @"fansFastests";

@interface FansFastestViewController ()
@property (nonatomic,strong) NSArray *fansFastests;
@end

@implementation FansFastestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FansFastestCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
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
    
    [manager GET: fansFastestURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
        self.fansFastests = [FansFastestItems mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fansFastests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FansFastestCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.fansFastest = self.fansFastests[indexPath.row];
    
    return cell;
}
@end
