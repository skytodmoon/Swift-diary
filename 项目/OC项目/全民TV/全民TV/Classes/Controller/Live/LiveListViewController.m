//
//  LiveListViewController.m
//  全民TV
//
//  Created by 金亮齐 on 2017/7/24.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "LiveListViewController.h"
#import "LiveListManager.h"

@interface LiveListViewController ()

@property(nonatomic,weak) UICollectionView *liveListView;

@end

static NSString *const reuseIdentifer  = @"LiveListCell";

@implementation LiveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Home_List_BGColor;
    [self getListData];
    [self configureCollectionView];
    // Do any additional setup after loading the view.
}

-(void)getListData{
    [LIVELIST_MANAGER requestLiveListData:^(int code, NSString *msg) {
        [self hideLoading];
        [self.liveListView.mj_header endRefreshing];
        if (code == RES_CODE_OK)
            [self.liveListView reloadData];
        else
            [self make:msg];
    }];
}

-(void)configureCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake((SCREEN_WIDTH-30)/2, 155);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = Home_List_BGColor;
    [self.view addSubview:collectionView];
    _liveListView = collectionView;
    
    MJWeakSelf
    collectionView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        [weakSelf getListData];
    }];
    
    [collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(void)hideLoading
{
    [self.loadImageView stopGifAnim];
    self.loadImageView = nil;
}

@end
