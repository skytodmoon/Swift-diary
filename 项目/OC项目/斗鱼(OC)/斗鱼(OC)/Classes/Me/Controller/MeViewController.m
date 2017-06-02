//
//  MeViewController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MeViewController.h"
#import "MeHeaderView.h"
#import "MeCell.h"
#import "StartedToRemindController.h"
#import "TicketQueryController.h"
#import "SettingViewController.h"
#import "GameCenterViewController.h"

@interface MeViewController ()

@property (nonatomic,strong) NSArray *resources;

@end

@implementation MeViewController
- (NSArray *)resources {
    if (!_resources) {
        _resources = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"me.plist" ofType:nil]];
    }
    return _resources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 不要自动调整scrollView的边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    MeHeaderView *headerView = [[MeHeaderView alloc] init];
    headerView.frame = CGRectMake(0, 0, self.view.width, 295);
    self.tableView.tableHeaderView = headerView;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MeCell" bundle:nil] forCellReuseIdentifier:@"meCell"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.resources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.resources[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"meCell"];
    cell.dict = self.resources[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self.navigationController pushViewController:[[cell.targetClass alloc] init] animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

@end
