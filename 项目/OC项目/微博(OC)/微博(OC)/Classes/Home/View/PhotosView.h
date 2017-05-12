//
//  PhotosView.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosView : UIImageView

@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片个数返回photosView大小
 */
+ (CGSize)sizeWithPhotosCount:(int)count;

@end
