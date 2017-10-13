//
//  NetworkHelper.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString * const POST;
FOUNDATION_EXTERN NSString * const GET;

@interface NetworkHelper : NSObject

+ (instancetype)sharedInstance;

- (void)requestMethod:(NSString *)method url:(NSString *)url parameters:(id)parameters finishBlock:(void (^)(id data, NSError *error))finishBlock;
@end
