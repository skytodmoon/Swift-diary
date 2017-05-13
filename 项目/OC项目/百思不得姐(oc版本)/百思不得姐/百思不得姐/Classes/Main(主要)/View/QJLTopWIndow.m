//
//  QJLTopWIndow.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/6.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLTopWIndow.h"

@implementation QJLTopWIndow

static UIWindow *window_;

+(void)initialize {
    window_ = [[UIWindow alloc] init];
    window_.frame = CGRectMake(0, 0, SCREENW, 20);
    window_.windowLevel = UIWindowLevelAlert;
    [window_ addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(windowClick)]];
}

+(void)show {
    window_.hidden = NO;
}

+(void)windowClick {
    
}

@end

