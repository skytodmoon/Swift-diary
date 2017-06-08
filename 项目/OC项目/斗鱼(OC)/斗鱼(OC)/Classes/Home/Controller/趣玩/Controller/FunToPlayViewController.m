//
//  FunToPlayViewController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FunToPlayViewController.h"
#import "CollectionViewCell.h"
#import "Room.h"
#import "LivePlayViewController.h"

@interface FunToPlayViewController ()

@property (nonatomic,strong) NSMutableArray *datas;

@property (nonatomic,assign) int ofset;

@property (nonatomic,copy) NSString *lastUrl;

@end

@implementation FunToPlayViewController


- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"funToPlayCell"];
    
    [self setupRefresh];
    

    [self.collectionView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupRefresh {
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [header setImages:@[[UIImage imageNamed:@"dyla_img_mj_stateIdle_64x66_"]] forState:MJRefreshStateIdle];
    [header setImages:@[[UIImage imageNamed:@"dyla_img_mj_statePulling_64x66_"]] forState:MJRefreshStatePulling];
    [header setImages:@[[UIImage imageNamed:@"dyla_img_mj_stateRefreshing_01_135x66_"],
                        [UIImage imageNamed:@"dyla_img_mj_stateRefreshing_02_135x66_"],
                        [UIImage imageNamed:@"dyla_img_mj_stateRefreshing_03_135x66_"],
                        [UIImage imageNamed:@"dyla_img_mj_stateRefreshing_04_135x66_"]] duration:0.5 forState:MJRefreshStateRefreshing];
    [header setTimeLabelHidden:YES forState:MJRefreshStateRefreshing];
    self.collectionView.mj_header = header;
    
    
    self.collectionView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)refreshData {
    self.ofset = 0;
    __block NSString *url = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/getColumnRoom/3?aid=ios&client_sys=ios&limit=20&offset=%d&time=1468825860&auth=4832d19a1c06d9deb24ae2449226422d", self.ofset];
    self.lastUrl = url;
    [self.collectionView.mj_footer resetNoMoreData];
    
    [[HttpManager sharedInstance] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (![self.lastUrl isEqualToString:url]) {
            return ;
        }
        // 删除之前的所有元素
        [self.datas removeAllObjects];
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *roomsDict = dict[@"data"];
        NSArray *rooms = [Room mj_objectArrayWithKeyValuesArray:roomsDict];
        [self.datas addObjectsFromArray:rooms];
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.collectionView.mj_header endRefreshing];
    }];
    
}

- (void)loadMoreData {
    self.ofset += 20;
    __block NSString *url = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/getColumnRoom/3?aid=ios&client_sys=ios&limit=20&offset=%d&time=1468825860&auth=4832d19a1c06d9deb24ae2449226422d", self.ofset];
    self.lastUrl = url;
    
    [[HttpManager sharedInstance] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (![self.lastUrl isEqualToString:url]) {
            return ;
        }
        
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *roomsDict = dict[@"data"];
        NSArray *rooms = [Room mj_objectArrayWithKeyValuesArray:roomsDict];
        [self.datas addObjectsFromArray:rooms];
        [self.collectionView reloadData];
        if (rooms.count == 0) {
            [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.collectionView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        self.ofset -= 20;
        [self.collectionView.mj_footer endRefreshing];
    }];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"funToPlayCell" forIndexPath:indexPath];
    cell.room = self.datas[indexPath.item];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(ItemMargin, ItemMargin, -44 + ItemMargin, ItemMargin);
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LivePlayViewController *playVc = [[LivePlayViewController alloc] init];
    [self.navigationController pushViewController:playVc animated:YES];
}

@end
