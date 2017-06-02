//
//  LiveFishShowViewController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "LiveFishShowViewController.h"

@interface LiveFishShowViewController ()

@end

@implementation LiveFishShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 设置cell的类型
    self.cellType = LiveCellTypeNormal;
    
    [self.collectionView.mj_header beginRefreshing];
}

- (void)refreshData {
    self.ofset = 0;
    __block NSString *url = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/getColumnRoom/10?aid=ios&client_sys=ios&limit=20&offset=%d&time=1469015520&auth=19d9ee69d294976b98b90b67a2ca9f94", self.ofset];
    self.lastUrl = url;
    [self.collectionView.mj_footer resetNoMoreData];
    
//    [[HttpManager sharedInstance] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                if (![self.lastUrl isEqualToString:url]) {
//                    return ;
//                }
//                // 删除之前的所有元素
//                [self.rooms removeAllObjects];
//        
//
//                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject.mj_JSONData options:NSJSONReadingMutableContainers error:nil];
//        
//                NSArray *roomsDict = dict[@"data"];
//                NSArray *rooms = [Room mj_objectArrayWithKeyValuesArray:roomsDict];
//                [self.rooms addObjectsFromArray:rooms];
//        
//        
//                [self.collectionView reloadData];
//                [self.collectionView.mj_header endRefreshing];
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [self.collectionView.mj_header endRefreshing];
//    }];
}

- (void)loadMoreData {
    self.ofset += 20;
    __block NSString *url = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/getColumnRoom/10?aid=ios&client_sys=ios&limit=20&offset=%d&time=1469015520&auth=19d9ee69d294976b98b90b67a2ca9f94", self.ofset];
    self.lastUrl = url;
    
//    [[HttpManager sharedInstance] GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, NSData *responseObject) {
//        if (![self.lastUrl isEqualToString:url]) {
//            return ;
//        }
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject.mj_JSONData options:NSJSONReadingMutableContainers error:nil];
//        NSArray *roomsDict = dict[@"data"];
//        NSArray *newRooms = [Room mj_objectArrayWithKeyValuesArray:roomsDict];
//        [self.rooms addObjectsFromArray:newRooms];
//        [self.collectionView reloadData];
//        if (newRooms.count == 0) {
//            [self.collectionView.mj_footer endRefreshingWithNoMoreData];
//        }
//        [self.collectionView.mj_footer endRefreshing];
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        self.ofset -= 20;
//        [self.collectionView.mj_footer endRefreshing];
//    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", [self.rooms[indexPath.item] room_name]);
    // 播放视频
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}

@end
