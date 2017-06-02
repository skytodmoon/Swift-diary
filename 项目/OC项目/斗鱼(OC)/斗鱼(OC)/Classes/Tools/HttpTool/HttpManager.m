//
//  HttpManager.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HttpManager.h"

@implementation HttpManager

static HttpManager *_sharedInstance = nil;

+ (id)sharedInstance {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedInstance = [self manager];
        _sharedInstance.requestSerializer = [AFHTTPRequestSerializer serializer];
        _sharedInstance.responseSerializer = [AFHTTPResponseSerializer serializer];
        _sharedInstance.requestSerializer.timeoutInterval = 10;

    });
    
    return _sharedInstance;
}


@end
