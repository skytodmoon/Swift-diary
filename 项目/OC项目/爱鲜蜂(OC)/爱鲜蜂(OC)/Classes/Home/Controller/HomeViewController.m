//
//  HomeViewController.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeViewController.h"
#import "WebViewController.h"
#import "Goods.h"
#import "HomeCell.h"
#import "HomeCategoryCell.h"
#import "HomeHeadData.h"
#import "HomeHeadView.h"
#import <UIImageView+WebCache.h>
#import "BaseTabBarViewController.h"
#import "AnimationRefreshHeader.h"

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) HomeHeadData *homeHeadData;
@property (nonatomic, strong) HomeHeadView *homeheadView;
@property (nonatomic, strong) NSArray<Goods *> *freshHots;
@end

@implementation HomeViewController
static NSString  *homeCell = @"homeCell";
static NSString  *expandCell = @"expandCell";

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[BaseTabBarViewController sharedController] hidesTabBar:NO animated:YES];
}
#pragma life sycle method
- (void)viewDidLoad{
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:1];
    [self addNotification];
    [self buildCollectionView];
    [self buildTableHeadView];
    [self bulidTableViewRefresh];
}
- (void)addNotification{
    [Notification addObserver:self selector:@selector(homeTableHeadViewHeightDidChange:) name:HomeTableHeadViewHeightDidChange object:nil];
}
- (void)homeTableHeadViewHeightDidChange:(NSNotification *)notification{
    NSLog(@"height = %lf",[notification.object floatValue]);
    CGFloat height = [notification.object floatValue];
    CGFloat room = 10;
    self.collectionView.mj_header.ignoredScrollViewContentInsetTop = height+10;
    self.homeheadView.frame = CGRectMake(0, -height-room, Width, height);
    self.collectionView.contentInset = UIEdgeInsetsMake(height+room, 0, 100, 0);
    self.collectionView.contentOffset = CGPointMake(0, -height-room);
}
- (void)buildCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 8;
    layout.minimumLineSpacing = 8;
    layout.sectionInset = UIEdgeInsetsMake(0, HomeCollectionViewCellMargin, 0, HomeCollectionViewCellMargin);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    [_collectionView registerClass:[HomeCategoryCell class] forCellWithReuseIdentifier:homeCell];
    [_collectionView registerClass:[HomeCell class] forCellWithReuseIdentifier:expandCell];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)buildTableHeadView{
    __weak typeof (self) weakSelf = self;
    [HomeHeadData loadHeadData:^(HomeHeadData *data, NSError *error) {
        weakSelf.homeHeadData = data;
        NSLog(@"data = %@",data);
        self.homeheadView = [[HomeHeadView alloc]initWithHeadData:data];
        self.homeheadView.callback = ^(HeadViewItemType type,NSInteger tag){
            [weakSelf showActityDetail:type tag:tag];
        };
        [self.collectionView addSubview:self.homeheadView];
        NSLog(@"self.subviews = %@",self.view.subviews);
    }];
    
    [GoodsData loadGoodsData:^(NSArray<Goods *> *data, NSError *error) {
        weakSelf.freshHots = data;
        [self.collectionView reloadData];
    }];
}
- (void)bulidTableViewRefresh{
    AnimationRefreshHeader *header = [AnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefeshData)];
    header.gifView.frame = CGRectMake(0, 0, 100, 100);
    _collectionView.mj_header = header;
    [_collectionView.mj_header beginRefreshing];
}
- (void)headerRefeshData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_collectionView.mj_header endRefreshing];
    });
}
- (void)showActityDetail:(HeadViewItemType)type tag:(NSInteger)tag{
    ActInfo *actInfo = self.homeHeadData.act_info[type];
    Activity *cativity = actInfo.act_rows[tag].activity;
    [self.navigationController pushViewController:[[WebViewController alloc]initWithActivity:cativity ] animated:YES];
    
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return self.homeHeadData.category.act_rows.count;
    }else{
        return self.freshHots.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HomeCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:homeCell forIndexPath:indexPath];
        __weak typeof(self) weakSelf = self;
        cell.cellback = ^(Goods *goods){
            UIViewController *goodsVc = [[UIViewController alloc]init];
            goodsVc.title = goods.name;
            goodsVc.view.backgroundColor = [UIColor whiteColor];
            goodsVc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:goodsVc animated:YES];
        };
        cell.cellInfo = self.homeHeadData.category.act_rows[indexPath.row];
        return cell;
    }
    
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:expandCell forIndexPath:indexPath];
    NSLog(@"self.freshHots[indexPath.row] = %@",self.freshHots[indexPath.row]);
    Goods *goods = self.freshHots[indexPath.row];
    cell.goods = goods;
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = CGSizeZero;
    if (indexPath.section == 0) {
        itemSize = CGSizeMake(Width, 330);
    }else if (indexPath.section == 1){
        itemSize = CGSizeMake((Width - HomeCollectionViewCellMargin * 2) * 0.5 - 4, 260);
    }
    return itemSize;
}





@end
