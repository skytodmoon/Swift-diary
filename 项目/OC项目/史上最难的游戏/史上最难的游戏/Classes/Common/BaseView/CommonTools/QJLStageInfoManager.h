//
//  QJLStageInfoManager.h
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QJLStage.h"

@class QJLStageInfo;

@interface QJLStageInfoManager : NSObject

+ (instancetype)sharedStageInfoManager;

- (BOOL)saveStageInfo:(QJLStageInfo *)stageInfo;
- (QJLStageInfo *)stageInfoWithNumber:(int)number;

- (BOOL)unlockNextStage;

@end
