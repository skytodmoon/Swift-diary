//
//  HotView.h
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotView : UIView
- (instancetype)initWithImages:(NSArray<NSString *> *)images title:(NSArray *)titles placeHolder:(UIImage *)image;
@property (nonatomic, copy) ClikedCallback callback;

@end
