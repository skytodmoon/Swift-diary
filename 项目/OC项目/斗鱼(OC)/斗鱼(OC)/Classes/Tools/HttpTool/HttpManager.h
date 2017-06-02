//
//  HttpManager.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>


@interface HttpManager : AFHTTPSessionManager

+ (id)sharedInstance;

@end
