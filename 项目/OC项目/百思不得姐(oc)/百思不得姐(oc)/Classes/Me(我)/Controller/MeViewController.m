//
//  MeViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MeViewController.h"
#import "LoginRegisterViewController.h"
#import "SettingViewController.h"
#import "WebViewController.h"
#import "MeItem.h"
#import "MeCell.h"


static NSString * const ID = @"cell";
static NSInteger const cols = 4;
static CGFloat const onemargin = 1;
#define itemWH (ScreenW - (cols - 1) * onemargin) / cols

@interface MeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) NSMutableArray *squareItems;
@property (nonatomic,weak) UICollectionView *collectionView;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置Navigation的样式
    [self setupNavigation];
    
    [self setupTableViewSpacing];
    
    //设置底部View
    [self setupFootView];
    
    //加载数据
    [self loadData];
    
    
}

//加载数据
- (void)loadData{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    [Networking GET:@"http://api.budejie.com/api/api_open.php" baseURL:nil params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray *dictArr = responseObject[@"square_list"];
        
        _squareItems = [MeItem mj_objectArrayWithKeyValuesArray:dictArr];
        
        [self resolveData];
        
        NSInteger count = _squareItems.count;
        NSInteger rows = (count - 1) / cols + 1;
        self.collectionView.sy_height = rows * itemWH;
        self.tableView.tableFooterView = self.collectionView;
        self.tableView.tableFooterView = self.collectionView;
        
        [self.collectionView reloadData];
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        //请求失败
        NSLog(@"%@",error);
    }];
    
}

//设置Navigation的样式
- (void)setupNavigation
{
    //设置背景颜色
    self.view.backgroundColor = CommonBgColor;
    //设置navigationItem.title的标题
    self.navigationItem.title = @"我的";
    //设置右边两个按钮，调用UITabBarItem+SYCategory.h里面的类方法，可直接设置按钮样式
    //设置按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" hightImage:@"mine-setting-icon-click" target:self action:@selector(settingItemClick)];
    
    //设置月亮按钮
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" selImage:@"mine-moon-icon-click" target:self action:@selector(moonItemClick:)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
    
}


- (void)resolveData
{
    NSInteger exter = self.squareItems.count % cols;
    if (exter) {
        exter = cols - exter;
        for (int i = 0; i < exter; i++) {
            [self.squareItems addObject:[[MeItem alloc] init]];
        }
    }
}
//设置按钮事件处理
- (void)settingItemClick
{
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}
//月亮按钮事件处理
- (void)moonItemClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        LoginRegisterViewController *login = [[LoginRegisterViewController alloc]init];
        [self presentViewController:login animated:YES completion:nil];
        
    }
    
}

//设置每个TableView的间距。理论:默认tableView只要是分组样式,默认每一组都有间距
- (void)setupTableViewSpacing
{
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(10 - 35, 0, 0, 0);
}

//设置底部的View

- (void)setupFootView
{
    //利用流水布局创建底部九宫格
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    layout.minimumInteritemSpacing = onemargin;
    layout.minimumLineSpacing = onemargin;
    
    //创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 1) collectionViewLayout:layout];
    collectionView.backgroundColor = CommonBgColor;
    _collectionView = collectionView;
    self.tableView.tableFooterView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.scrollEnabled = NO;
    [collectionView registerNib:[UINib nibWithNibName:@"MeCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
    self.tableView.tableFooterView = collectionView;
    
}


#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.squareItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.item = _squareItems[indexPath.row];
    
    return cell;
}

//点击选中某一个Item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MeItem *item = _squareItems[indexPath.row];
    //如果前缀不是http 则取消
    if([item.url hasPrefix:@"http"]){
        WebViewController *webVc = [[WebViewController alloc]init];
        webVc.url = [NSURL URLWithString:item.url];
        webVc.navigationItem.title = item.name;
        [self.navigationController pushViewController:webVc animated:YES];
    }else if ([item.url hasSuffix:@"Check"])
    {
        LoginRegisterViewController *login = [[LoginRegisterViewController alloc]init];
        [self presentViewController:login animated:YES completion:nil];
    }else if ([item.url hasSuffix:@"@dest=2"])
    {
        LoginRegisterViewController *login = [[LoginRegisterViewController alloc]init];
        [self presentViewController:login animated:YES completion:nil];
    }else if ([item.url hasSuffix:@"SearchUser"])
    {
        LoginRegisterViewController *login = [[LoginRegisterViewController alloc]init];
        [self presentViewController:login animated:YES completion:nil];
    }else
    {
        return;
    }
}

@end
