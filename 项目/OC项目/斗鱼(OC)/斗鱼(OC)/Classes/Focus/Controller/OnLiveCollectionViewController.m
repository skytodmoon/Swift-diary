//
//  OnLiveCollectionViewController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "OnLiveCollectionViewController.h"


@interface OnLiveCollectionViewController ()

@end

@implementation OnLiveCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)refreshData {
    [self.collectionView.mj_header endRefreshing];
}

- (void)loadMoreData {
    [self.collectionView.mj_footer endRefreshing];
}

@end
