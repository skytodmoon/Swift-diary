//
//  SortModal.h
//  美团iPad
//
//  Created by 金亮齐 on 2017/7/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortModal : NSObject

/** 1.默认排序 2.价格最低 3.价格最高 4.人气最高 5.最新发布 6.即将结束 7.离我最近 */
@property (assign, nonatomic) NSInteger value;
@property (copy, nonatomic) NSString *label;

@end
