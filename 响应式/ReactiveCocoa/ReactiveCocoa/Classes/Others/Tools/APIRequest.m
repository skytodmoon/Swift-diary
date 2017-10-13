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
#import "DBManager.h"

@implementation APIRequest

+(instancetype)sharedManager {
    static APIRequest *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[APIRequest alloc]init];
    });
    return _instance;
}

//首页专题列表
-(void)requestSpecialListFinishBlock:(void (^)(id, NSError *))finishBlock{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"currentPageIndex"] = @0;
    params[@"pageSize"] = @(20);
    params[@"isCache666"] = @(YES);
    [self requestMethod:POST url:@"http://m.htxq.net/servlet/SysArticleServlet?action=mainList" parameters:params.copy finishBlock:^(id data, NSError *error) {
        finishBlock(data,error);
    }];

}

//作者列表
-(void)requestAuthorListFinishBlock:(void (^)(id, NSError *))finishBlock{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"action"] = @"topArticleAuthor";
    [self requestMethod:POST url:@"http://ec.htxq.net/servlet/SysArticleServlet?currentPageIndex=0&pageSize=10" parameters:params.copy finishBlock:^(id data, NSError *error) {
        finishBlock(data,error);
    }];
}

-(void)requestMethod:(NSString *)methd url:(NSString *)url parameters:(NSMutableDictionary *)params finishBlock:(void(^)(id data, NSError *error)) finishBlock {
    NSString *cacheKey = [FFHelper connectBaseUrl:url params:params];
    BOOL isCache = [cacheKey containsString:@"isCache666"];
    [[NetworkHelper sharedInstance] requestMethod:methd url:url parameters:params finishBlock:^(id data, NSError *error) {
        if (error) {
            id cacheData = [[DBManager sharedManager] itemWithCacheKey:cacheKey];
            FFResponseModel *model = [FFResponseModel mj_objectWithKeyValues:cacheData];
            if (!model) {
                finishBlock(nil,error);
            }else {
                finishBlock(model,nil);
            }
            return;
        }
        
        FFResponseModel *model = [FFResponseModel mj_objectWithKeyValues:data];
        finishBlock(model,nil);
        if (isCache) {
            [[DBManager sharedManager] insertItem:data cacheKey:cacheKey];
        }
    }];
    
}

@end
