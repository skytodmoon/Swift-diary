//
//  MenuViewModel.m
//  日日煮
//
//  Created by 金亮齐 on 2017/3/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MenuViewModel.h"
#import "NSString+Extension.h"

@interface MenuViewModel ()

@property (nonatomic, assign) NSInteger page;

@end

@implementation MenuViewModel

#pragma mark - Method 网路请求
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
    }
    [NetManager getMessagerFormThePage:tmpPage CompletionHandler:^(MenuModel *model, NSError *error) {
        if (!error) {
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
                self.firstDate = model.data;
            }
            [self.dataList addObjectsFromArray:model.data];
            _page = tmpPage;
            _isLoadMore = model.data.count == 20;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
#pragma mark - Method Cell
- (NSInteger)numberForRow{
    return self.dataList.count;
}

- (NSURL *)iconIVForRow:(NSInteger)row{
    return self.dataList[row].imageUrl.yx_URL;
}

- (NSString *)clickCountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld",self.dataList[row].clickCount];
}

- (NSString *)shareCountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld",self.dataList[row].shareCount];
}

- (NSString *)cookTimeForRow:(NSInteger)row{
    return self.dataList[row].maketime;
}

- (NSString *)detailForRow:(NSInteger)row{
    return self.dataList[row].desc;
}

- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}
- (NSString *)releaseDateForRow:(NSInteger)row{
    NSDateFormatter *now = [[NSDateFormatter alloc] init];
    [now setDateStyle:NSDateFormatterShortStyle];
    [now setDateFormat:@"YYYY"];
    NSInteger currectYear = [now stringFromDate:[NSDate date]].integerValue;
    NSString *date = self.dataList[row].releaseDate;
    NSInteger year = [date substringToIndex:4].integerValue;
    if (year == currectYear) {
        return [date substringFromIndex:5];
    }
    return date;
}
- (MenuDataModel *)dataForRow:(NSInteger)row{
    return self.dataList[row];
}
#pragma mark - LazyLoad 懒加载
- (NSMutableArray<MenuDataModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<MenuDataModel *> alloc] init];
    }
    return _dataList;
}
@end
