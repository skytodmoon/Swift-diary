//
//  FFResponseModel.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFResponseModel : NSObject
/**
 提示信息
 */
@property (nonatomic, copy) NSString *msg;

/**
 返回的数据
 */
@property (nonatomic, strong) id result;

/**
 1 代表请求成功 0失败
 */
@property (nonatomic, assign) NSInteger status;

@end
