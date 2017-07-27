//
//  NSObject+Toast.h
//  全民TV
//
//  Created by 金亮齐 on 2017/7/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

//上下左右距离
#define TOAST_TEXT_MARGIN_TOP_BOTTOM  7.0f
#define TOAST_TEXT_MARGIN_LEFT_RIGHT  10.0f
//默认toast位置Y
#define TOAST_POSITION_Y   (SCREEN_HEIGHT-80.0f)

//字体
#define TOAST_TEXT_FONTSIZE         16.0f
//动画时间
#define TOAST_ANIMATION_DURATION    1.8f
//显示和消失时间
#define TOAST_ANI_STARTEND_DURATION 0.2f

@interface NSObject (Toast)

- (void)make:(NSString*)text duration:(CGFloat)duration backgroundColor:(UIColor*)color position:(CGPoint)point;

- (void)make:(NSString*)text duration:(CGFloat)duration position:(CGPoint)point;

- (void)make:(NSString*)text;

@end
