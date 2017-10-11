//
//  APIRequest.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIRequest : NSObject

+ (instancetype)sharedManager;

/// 首页专题列表
- (void)requestSpecialListFinishBlock:(void (^)(id data, NSError *error))finishBlock;
/// 作者列表
- (void)requestAuthorListFinishBlock:(void (^)(id data, NSError *error))finishBlock;

@end
