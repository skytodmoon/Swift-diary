//
//  NSObject+Toast.m
//  全民TV
//
//  Created by 金亮齐 on 2017/6/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NSObject+Toast.h"

@implementation NSObject (Toast)
- (void)sky_make:(NSString*)text duration:(CGFloat)duration backgroundColor:(UIColor*)color position:(CGPoint)point
{
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    
    //背景视图
    UIView* toastView = [[UIView alloc] init];
    toastView.tag = 0xf284655;
    toastView.backgroundColor = [UIColor clearColor];
    //黑色背景
    UIView* bkView = [[UIView alloc] init];
    bkView.backgroundColor = color;
    bkView.alpha = 0.8f;
    bkView.layer.masksToBounds = YES;
    bkView.layer.cornerRadius = 5.0f;
    
    //文字
    UILabel* textLabel = [[UILabel alloc] init];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.text = text;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.font = [UIFont systemFontOfSize:TOAST_TEXT_FONTSIZE];
    textLabel.numberOfLines = 0;
    textLabel.textAlignment = NSTextAlignmentCenter;
    [textLabel sizeToFit];
    if(textLabel.frame.size.width >= (SCREEN_WIDTH-TOAST_TEXT_MARGIN_LEFT_RIGHT*2))
    {
        CGRect rect = textLabel.frame;
        rect.size.width = (SCREEN_WIDTH-TOAST_TEXT_MARGIN_LEFT_RIGHT*2);
        textLabel.frame = rect;
        [textLabel sizeToFit];
    }
    
    //设置大小
    CGRect rect = textLabel.bounds;
    rect.size.width  += TOAST_TEXT_MARGIN_LEFT_RIGHT*2;
    rect.size.height += TOAST_TEXT_MARGIN_TOP_BOTTOM*2;
    toastView.frame = rect;
    toastView.center = point;
    bkView.frame = toastView.bounds;
    textLabel.center = CGPointMake(toastView.frame.size.width/2,
                                   toastView.frame.size.height/2);
    
    [toastView addSubview:bkView];
    [toastView addSubview:textLabel];
    
    [window addSubview:toastView];
    toastView.alpha = 0;
    
    //动画
    [UIView animateWithDuration:TOAST_ANI_STARTEND_DURATION
                     animations:^{
                         toastView.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:TOAST_ANI_STARTEND_DURATION
                                               delay:(duration-TOAST_ANI_STARTEND_DURATION*2)
                                             options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                                          animations:^{
                                              toastView.alpha = 0;
                                          }
                                          completion:^(BOOL finished) {
                                              [toastView removeFromSuperview];
                                          }];
                     }];
}


- (void)sky_make:(NSString*)text duration:(CGFloat)duration position:(CGPoint)point
{
    [self sky_make:text
          duration:duration
   backgroundColor:[UIColor blackColor]
          position:CGPointMake(SCREEN_WIDTH/2, TOAST_POSITION_Y)];
}

- (void)sky_make:(NSString*)text
{
    [self sky_make:text
          duration:TOAST_ANIMATION_DURATION
          position:CGPointMake(SCREEN_WIDTH/2, TOAST_POSITION_Y)];
}



@end
