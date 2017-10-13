//
//  APIRequest.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "APIRequest.h"
#import "FFResponseModel.h"
#import "FFHelper.h"
#import "NetworkHelper.h"

@implementation APIRequest

+(instancetype)sharedManager {
    static APIRequest *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[APIRequest alloc]init];
    });
    return _instance;
}

////首页专题列表
//-(void)requestSpecialListFinishBlock:(void (^)(id, NSError *))finishBlock{
//    NSMutableDictionary *params = @{}.mutableCopy;
//    params[@"currentPageIndex"] = @0;
//    params[@"pageSize"] = @(kPageSize);
//    params[@"isCache666"] = @(YES);
//    
//}
//
////作者列表
//-(void)requestAuthorListFinishBlock:(void (^)(id, NSError *))finishBlock{
//    
//}
//
//-(void)requestMethod:(NSString *)methd url:(NSString *)url parameters:(NSMutableDictionary *)params finishBlock:(void(^)(id data, NSError *error)) finishBlock {
//    NSString *cacheKey = [FFHelper connectBaseUrl:url params:params];
//    BOOL isCache = [cacheKey containsString:@"isCache666"];
//    [[NetworkHelper sharedInstance] requestMethod:methd url:url parameters:params finishBlock:^(id data, NSError *error) {
//
//    }];
//    
//}

@end
