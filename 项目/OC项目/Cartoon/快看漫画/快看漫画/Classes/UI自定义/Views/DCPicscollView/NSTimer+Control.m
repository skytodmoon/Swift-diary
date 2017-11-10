//
//  NSTimer+Control.m
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <objc/runtime.h>
#import "NSTimer+Control.h"

@implementation NSTimer (Control)



+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)())block repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(block_blockInvoke:) userInfo:[block copy] repeats:repeats];
}



+ (void)block_blockInvoke:(NSTimer *)timer {
    if (!timer.isValid) return;
    void (^block)() = timer.userInfo;
    
    if (block) block();
}


- (void)begin {
    self.fireDate = [NSDate dateWithTimeIntervalSinceNow:self.timeInterval];
}

- (void)pause {
    self.fireDate = [NSDate distantFuture];
}


@end
