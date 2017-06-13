//
//  SettingViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingItem.h"
#import "SettingGroupItem.h"
#import "SwitchSettingItem.h"
#import "SegmentedSettingItem.h"
#import "ArrowSettingItem.h"
#import "SettingCell.h"

@interface SettingViewController ()

// 记录当前tableView的所有数组
@property (nonatomic, strong) NSMutableArray *groups;

//保存缓存
@property (nonatomic,strong) NSString *saveCaching;
@end

@implementation SettingViewController

//懒加载
- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

//设置分组样式
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    self.view.backgroundColor = CommonBgColor;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    
    //添加第一组
    [self setupGroup1];
    
    //添加第二组
    [self setupGroup2];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    
    
}


//添加第一组，创建对应的模型数据然后直接调用其模型就可以直接创建组
- (void)setupGroup1
{
    SegmentedSettingItem *titleFond = [SegmentedSettingItem itemWithTitle:@"字体大小"];
    
    SwitchSettingItem *switchItem = [SwitchSettingItem itemWithTitle:@"摇一摇夜间模式"];
    
    SettingGroupItem *group = [SettingGroupItem groupWithItems:@[titleFond,switchItem]];
    
    group.headerTitle = @"功能设置";
    [self.groups addObject:group];
}


//第二组
- (void)setupGroup2{
    
    ArrowSettingItem *clear = [ArrowSettingItem itemWithTitle:_saveCaching];
    clear.itemOpertion = ^(NSIndexPath *indexPath){
        [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
        [self.tableView reloadData];
        
    };
    ArrowSettingItem *recommend = [ArrowSettingItem itemWithTitle:@"推荐给朋友"];
    ArrowSettingItem *help = [ArrowSettingItem itemWithTitle:@"帮助"];
    ArrowSettingItem *versions = [ArrowSettingItem itemWithTitle:@"当前版本：4.2"];
    ArrowSettingItem *about = [ArrowSettingItem itemWithTitle:@"关于我们"];
    ArrowSettingItem *privacy = [ArrowSettingItem itemWithTitle:@"隐私政策"];
    ArrowSettingItem *sustain = [ArrowSettingItem itemWithTitle:@"打分支持不得姐!"];
    
    SettingGroupItem *group1 = [SettingGroupItem groupWithItems:@[clear,recommend,help,versions,about,privacy,sustain]];
    group1.headerTitle = @"其他";
    
    [self.groups addObject:group1];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SettingGroupItem *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SettingCell *cell = [SettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    //    [self.tableView reloadData];
    //计算缓存
    CGFloat size = [SDImageCache sharedImageCache].getSize / 1000.0 / 1000;
    _saveCaching = [NSString stringWithFormat:@"清除缓存(已使用%.2fMB)",size];
    
    
    [self.groups removeAllObjects];
    //添加第一组
    [self setupGroup1];
    
    //添加第二组
    [self setupGroup2];
    
    //取出哪一组
    SettingGroupItem *group = self.groups[indexPath.section];
    
    //取出哪一行
    SettingItem *item = group.items[indexPath.row];
    
    //给cell传递模型
    cell.item = item;
    
    return cell;
}

//返回头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SettingGroupItem *group = self.groups[section];
    return group.headerTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //取出哪一组
    SettingGroupItem *group = self.groups[indexPath.section];
    
    //取出哪一行
    SettingItem *item = group.items[indexPath.row];
    
    //如果block有值则调用block方法
    if (item.itemOpertion) {
        item.itemOpertion(indexPath);
        return;
    }
    
    
}

@end
