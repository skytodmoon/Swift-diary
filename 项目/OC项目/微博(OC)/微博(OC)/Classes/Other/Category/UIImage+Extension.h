//
//  UIImage+Extension.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  返回一张可拉伸的图片
 */
+ (instancetype)resizedImageWithName:(NSString *)imageName;
+ (instancetype)resizedImageWithName:(NSString *)imageName width:(CGFloat)width height:(CGFloat)height;
@end
