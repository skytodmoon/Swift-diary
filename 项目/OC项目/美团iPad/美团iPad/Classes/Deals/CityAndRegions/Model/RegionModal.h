//
//  RegionModal.h
//  美团iPad
//
//  Created by 金亮齐 on 2017/7/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegionModal : NSObject

/** 区域名称 */
@property (copy, nonatomic) NSString *name;
/** 子区域 */
@property (strong, nonatomic) NSArray *subregions;

@end
