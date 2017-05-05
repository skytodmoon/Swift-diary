//
//  QJLStage.m
//  Game
//
//  Created by 金亮齐 on 16/7/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage.h"

@implementation QJLStage

+ (instancetype)stageWithDict:(NSDictionary *)dict {
    QJLStage *stage = [QJLStage new];
    stage.icon = dict[@"icon"];
    stage.format = dict[@"format"];
    stage.max = [dict[@"max"] doubleValue];
    stage.min = [dict[@"min"] doubleValue];
    stage.title = dict[@"title"];
    stage.intro = dict[@"intro"];
    stage.unit = dict[@"unit"];
    stage.fail = dict[@"fail"];
    return stage;
}

@end
