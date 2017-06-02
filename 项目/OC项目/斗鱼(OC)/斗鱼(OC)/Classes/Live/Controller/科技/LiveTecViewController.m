//
//  LiveTecViewController.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "LiveTecViewController.h"
#import "LiveTopView.h"
#import "LiveDownView.h"
#import "Tag.h"


@interface LiveTecViewController () <LiveTopViewDelegate>

@property (nonatomic,weak) LiveTopView *topView;

@property (nonatomic,weak) LiveDownView *downView;

@property (nonatomic,copy) NSString *url;
/**
 *  存储当前的标签
 */
@property (nonatomic,strong) Tag *tag;
@end

@implementation LiveTecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"AdCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"adCell"];
    
    // 设置cell的类型
    self.cellType = LiveCellTypeNormal;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 50, 0);
    
    // 第一次进来加载全部
    [self liveTopView:nil didClickButtonTitle:nil];
    
    [self.collectionView.mj_header beginRefreshing];
}

- (void)refreshData {
    [self loadNewData];
    if (self.topView == nil) {
        // 加载顶部的数据
        [self loadAllGameData];
    }
}

- (void)loadNewData {
    self.ofset = 0;
    __block NSString *url = self.url;
    self.lastUrl = url;
    [self.collectionView.mj_footer resetNoMoreData];
//    [[HttpManager sharedInstance] GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, NSData *responseObject) {
//        if (![self.lastUrl isEqualToString:url]) {
//            return ;
//        }
//        // 删除之前的所有元素
//        [self.rooms removeAllObjects];
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject.mj_JSONData options:NSJSONReadingMutableContainers error:nil];
//        NSArray *roomsDict = dict[@"data"];
//        NSArray *rooms = [Room mj_objectArrayWithKeyValuesArray:roomsDict];
//        [self.rooms addObjectsFromArray:rooms];
//        
//        [self.collectionView reloadData];
//        [self.collectionView.mj_header endRefreshing];
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
//        [self.collectionView.mj_header endRefreshing];
//    }];
}

- (void)loadMoreData {
    self.ofset += 20;
    __block NSString *url = self.url;
    self.lastUrl = url;
//    
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

- (void)loadAllGameData {
//    [[HttpManager sharedInstance] GET:@"http://capi.douyucdn.cn/api/v1/getHotRoom/3?aid=ios&client_sys=ios&time=1468825800&auth=94d0ae945c16542cc6dee7fe031f1316" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, NSData *responseObject) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject.mj_JSONData options:NSJSONReadingMutableContainers error:nil];
//        NSArray *tagsDict = dict[@"data"];
//        // 删除最热的标签
//        NSMutableArray *array = [NSMutableArray arrayWithArray:[Tag mj_objectArrayWithKeyValuesArray:tagsDict]];
//        [array removeObjectAtIndex:0];
//        // 添加顶部的scrollView
//        LiveTopView *topView = [[LiveTopView alloc] init];
//        topView.delegate = self;
//        topView.frame = CGRectMake(0, 0, self.view.width, 50);
//        [self.view addSubview:topView];
//        self.topView = topView;
//        
//        self.topView.tags = array;
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
//    }];
}


#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", [self.rooms[indexPath.item] room_name]);
    // 发出添加到常用的通知
    if (self.tag != nil) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"addTag" object:nil userInfo:@{@"tag" : self.tag}];
    }
    // 播放视频
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    
}

#pragma mark LiveTopViewDelegate
- (void)liveTopView:(LiveTopView *)topView didClickButtonTagNumber:(NSInteger)tagNumber {
    NSString *url = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/live/%ld?aid=ios&client_sys=ios&limit=20&offset=%d&time=1469009040&auth=411b9ed1d270efe90e260391e0a93d62", tagNumber, self.ofset];
    self.url = url;
    // 存储当前的标签
    for (Tag *tag in self.topView.tags) {
        if (tag.tag_id.integerValue == tagNumber) {
            self.tag = tag;
            break;
        }
    }
    [self.collectionView.mj_header beginRefreshing];
}

- (void)liveTopView:(LiveTopView *)topView didClickButtonTitle:(NSString *)title {
    NSString *url = [NSString stringWithFormat:@"http://capi.douyucdn.cn/api/v1/getColumnRoom/3?aid=ios&client_sys=ios&limit=20&offset=%d&time=1469008980&auth=3392837008aa8938f7dce0d8c72c321d",self.ofset];
    self.url = url;
    [self.collectionView.mj_header beginRefreshing];
}


@end
