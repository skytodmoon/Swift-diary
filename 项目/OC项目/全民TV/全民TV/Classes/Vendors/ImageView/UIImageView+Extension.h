//
//  UIImageView+Extension.h
//  全民TV
//
//  Created by 金亮齐 on 2017/6/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)
// 播放GIF
- (void)playGifAnim:(NSArray *)images;
// 停止动画
- (void)stopGifAnim;
@end
