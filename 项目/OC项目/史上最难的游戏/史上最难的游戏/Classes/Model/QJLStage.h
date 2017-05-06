//
//  QJLStage.h
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QJLStageInfo;

@interface QJLStage : NSObject

@property (nonatomic, assign) int num;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *format;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, assign) double max;
@property (nonatomic, assign) double min;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *fail;

@property (nonatomic, strong) QJLStageInfo *userInfo;

+ (instancetype)stageWithDict:(NSDictionary *)dict;

@end
