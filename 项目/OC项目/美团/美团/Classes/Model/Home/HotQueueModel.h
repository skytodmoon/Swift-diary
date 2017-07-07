//
//  HotQueueModel.h
//  美团
//
//  Created by 金亮齐 on 2017/7/5.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotQueueModel : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *imageUrl ;
@property(nonatomic, strong) NSNumber *within;
@property(nonatomic, strong) NSString *comment;
@property(nonatomic, strong) NSString *serviceUrl;
@end
