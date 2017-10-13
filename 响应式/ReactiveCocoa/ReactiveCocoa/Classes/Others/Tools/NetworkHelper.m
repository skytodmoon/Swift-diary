//
//  NetworkHelper.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NetworkHelper.h"

NSString * const POST = @"POST";
NSString * const GET = @"GET";

@interface NetworkHelper()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation NetworkHelper

+(instancetype)sharedInstance {
    static NetworkHelper *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[NetworkHelper alloc]init];
    });
    return _instance;
}

- (void)requestMethod:(NSString *)method url:(NSString *)url parameters:(id)parameters finishBlock:(void (^)(id, NSError *))finishBlock {
    if ([method isEqualToString:GET]) {
        [self GET:url parameters:parameters finishBlock:finishBlock];
    } else {
        [self POST:url parameters:parameters finishBlock:finishBlock];
    }
}

- (void)GET:(NSString *)URLString parameters:(id)parameters finishBlock:(void (^)(id, NSError *))finishBlock {
    [self.manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finishBlock(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finishBlock(nil,error);
    }];
}

- (void)POST:(NSString *)URLString parameters:(id)parameters finishBlock:(void (^)(id, NSError *))finishBlock {
    [self.manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finishBlock(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finishBlock(nil,error);
    }];
}

- (AFHTTPSessionManager *)manager {
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
        _manager.requestSerializer.timeoutInterval = 15;
    }
    return _manager;
}

@end
