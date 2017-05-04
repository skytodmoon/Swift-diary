//
//  QJLStageInfo.h
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QJLStageInfo : NSObject <NSCoding>

@property (nonatomic, copy) NSString *rank;
@property (nonatomic, assign) int num;
@property (nonatomic, assign) double score;
@property (nonatomic, assign, getter = isUnlock) BOOL unlock;

@end
