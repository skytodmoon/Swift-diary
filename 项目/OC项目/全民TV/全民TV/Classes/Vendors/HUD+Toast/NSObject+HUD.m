//
//  NSObject+HUD.m
//  全民TV
//
//  Created by 金亮齐 on 2017/6/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NSObject+HUD.h"

@implementation NSObject (HUD)
- (void)showInfo:(NSString *)info
{
    if ([self isKindOfClass:[UIViewController class]] || [self isKindOfClass:[UIView class]]) {
        [[[UIAlertView alloc] initWithTitle:@"喵播" message:info delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
    }
}
@end
