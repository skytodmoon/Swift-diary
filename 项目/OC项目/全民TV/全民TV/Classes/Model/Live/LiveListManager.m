//
//  LiveListManager.m
//  全民TV
//
//  Created by 金亮齐 on 2017/7/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "LiveListManager.h"
#import "OtherModel.h"

@implementation LiveListManager

+ (LiveListManager*)share
{
    static LiveListManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LiveListManager alloc]init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.liveListData = [[NSMutableArray alloc]init];
    }
    return self;
}

/** 请求数据 */
- (void)requestLiveListData:(DataParseBlock)block{

    [HttpClient requestWithType:HttpRequestTypeGet
                         UrlString:HOME_ALL_LIST
                        Parameters:nil
                      SuccessBlock:^(id responseObject) {
                          NSLog(@"直播列表数据 = %@",responseObject);
                          if (responseObject)
                          {
                              OtherModel * model = [OtherModel modelWithJSON:responseObject];
                              [model.data enumerateObjectsUsingBlock:^(CategoryListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                  [self.liveListData addObject:obj];
                              }];
                              block(RES_CODE_OK,@"");
                          }else
                              block(CH_ERR_DATAPARSE,@"数据有误");
                          
                      } FailureBlock:^(NSError *error) {
                          block(CH_ERR_NETDATA,@"网络有误");
                      }];
}

@end
