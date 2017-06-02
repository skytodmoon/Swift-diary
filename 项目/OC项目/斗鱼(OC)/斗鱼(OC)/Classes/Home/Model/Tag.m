//
//  RoomList.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "Tag.h"

@implementation Tag

+ (void)load {
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{ @"room_list" : [Room class]};
    }];
}

- (BOOL)isEqual:(Tag *)object {
    if ([object.tag_id isEqualToString:self.tag_id] && [object.tag_name isEqualToString:self.tag_name]) {
        return YES;
    }
    return NO;
}

MJCodingImplementation

@end
