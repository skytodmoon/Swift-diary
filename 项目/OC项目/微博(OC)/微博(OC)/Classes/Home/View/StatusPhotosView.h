
//  Weibo
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface StatusPhotosView : UIView
@property(nonatomic,strong) NSArray *photos;
/**
 *  根据图片个数计算相册的尺寸
 */
+ (CGSize)sizeWithCount:(int)count;

@end
