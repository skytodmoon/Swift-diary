//
//  NetWorkManager.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AFNetworking.h"

static NSString * const NetCode     = @"code";
static NSString * const NetOk       = @"OK";
static NSString * const NetData     = @"data";
static NSString * const NetMessage  = @"message";
static NSString * const HTTPSchema  = @"http:";
static NSString * const HTTPGET     = @"GET";
static NSString * const HTTPPOST    = @"POST";
static NSString * const HTTPDELETE  = @"DELETE";

@interface NetWorkManager : AFHTTPSessionManager

@property (nonatomic,readonly) BOOL hasNetWork;

+ (instancetype)share;

- (NSURLSessionDataTask *)requestWithMethod:(NSString *)method
                                        url:(NSString *)url
                                 parameters:(id)parameters
                                   complish:(void (^)(id res,NSError *error))complish;

@end
