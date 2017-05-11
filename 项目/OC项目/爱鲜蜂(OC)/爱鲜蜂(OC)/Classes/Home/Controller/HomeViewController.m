//
//  HomeViewController.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeadView.h"
#import "HomeHeadData.h"
#import "WebViewController.h"

@interface HomeViewController ()
@property (nonatomic,strong) HomeHeadView *headView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray<Goods *> *freshHots;
@property (nonatomic,strong) HomeHeadData *homeHeadData;
@property (nonatomic,assign) CGFloat homeTableHead;
@property (nonatomic,strong) HomeHeadView *homeHeadView;
@end

static NSString *homeCellId = @"homeCellId";
static NSString *homeCategoryCellId = @"homeCategoryCellId";
static NSString *footerCellId = @"footerCellId";
static NSString *headerCellId = @"headerCellId";


@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotification];
    [self buildTableHeadView];
    // Do any additional setup after loading the view.
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shopCarBuyNumberDidChange) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(homeTableHeadViewHeightDidChange:) name:HomeTableHeadViewHeightDidChange object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)shopCarBuyNumberDidChange {
    [self.collectionView reloadData];
}
- (void)buildTableHeadView {
    __weak typeof(self) wself = self;
    [HomeHeadData loadHeadData:^(HomeHeadData *homeHeadData, NSError *error) {
        wself.homeHeadData = homeHeadData;
        self.homeHeadView = [[HomeHeadView alloc]initWithHeadData:homeHeadData];
        self.homeHeadView.callback = ^(HeadViewItemType type,NSInteger tag){
            [wself showActityDetail:type tag:tag];
        };
        [self.collectionView addSubview:self.homeHeadView];
    }];
    [GoodsData loadGoodsData:^(NSArray<Goods *> *freshHots, NSError *error) {
        wself.freshHots = freshHots;
        [wself.collectionView reloadData];
    }];
    
}

- (void)showActityDetail:(HeadViewItemType)type tag:(NSInteger)tag{
    ActInfo *actInfo = self.homeHeadData.act_info[type];
    Activity *activity = actInfo.act_rows[tag].activity;
    [self.navigationController pushViewController:[[WebViewController alloc]initWithActivity:activity] animated:YES];
}


@end
