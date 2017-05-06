//
//  QJLStageInfoManager.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStageInfoManager.h"
#import "QJLStageInfo.h"

#define fileName @"stageInfos"
#define path [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:fileName]

@interface QJLStageInfoManager ()

@property (nonatomic, strong) NSMutableDictionary *allStageInfos;

@end

@implementation QJLStageInfoManager

static QJLStageInfoManager *instance = nil;
+ (instancetype)sharedStageInfoManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [QJLStageInfoManager new];
    });
    
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.allStageInfos = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!self.allStageInfos) {
            self.allStageInfos = [NSMutableDictionary dictionary];
            QJLStageInfo *info = [QJLStageInfo new];
            info.num = 1;
            [self.allStageInfos setObject:info forKey:@1];
            
            [self saveStageInfo:info];
        }
    }
    
    return self;
}

- (BOOL)saveStageInfo:(QJLStageInfo *)stageInfo {
    
    if (stageInfo.num <= 0) return NO;
    
    [self.allStageInfos setObject:stageInfo forKey:@(stageInfo.num)];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NewCount" object:@(stageInfo.num)];
    
    if (stageInfo.rank && (![stageInfo.rank isEqualToString:@"f"]) && (![self stageInfoWithNumber:stageInfo.num + 1] || ![self stageInfoWithNumber:stageInfo.num + 1].unlock)) {
        QJLStageInfo *nextStageInfo = [[QJLStageInfo alloc] init];
        nextStageInfo.num = stageInfo.num + 1;
        [self saveStageInfo:nextStageInfo];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NewStageDidUnLock" object:@(nextStageInfo.num)];
    }
    
    return [NSKeyedArchiver archiveRootObject:self.allStageInfos toFile:path];
}

- (QJLStageInfo *)stageInfoWithNumber:(int)number {
    //    NSAssert(number > 0, @"读取必须大于0啊");
    
    QJLStageInfo *info = self.allStageInfos[@(number)];
    
    return info;
}

- (BOOL)unlockNextStage {
    
    for (int i = 2 ; i < 25; i++) {
        NSNumber *num = [NSNumber numberWithInt:i];
        
        if (![self.allStageInfos objectForKey:num]) {
            
            QJLStageInfo *info = [QJLStageInfo new];
            info.num = i;
            [self.allStageInfos setObject:info forKey:num];
            
            return YES;
        }
    }
    
    return NO;
}

@end
