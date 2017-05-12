
//
//  HotView.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HotView.h"
#import "IconImageTextView.h"

@implementation HotView

- (instancetype)initWithImages:(NSArray<NSString *> *)images title:(NSArray *)titles placeHolder:(UIImage *)image {
    
    self = [super init];
    if (!self ) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    for (NSInteger i = 0; i<images.count; i++) {
        IconImageTextView *iconView = [IconImageTextView IconImageTextView:images[i] title:titles[i] placeHolder:image];
        iconView.tag = i;
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicked:)];
        NSLog(@"iconView = %@",iconView);
        [iconView addGestureRecognizer:tap];
        NSLog(@"i = %zd",i);
        [self addSubview:iconView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat iconW = (Width - 2 * DefaultMargin) / 4;
    CGFloat iconH = iconW * 0.68 + 20;
    for (NSInteger i = 0; i<self.subviews.count; i++) {
        IconImageTextView *iconView = self.subviews[i];
        NSLog(@"iconView = %@",iconView);
        CGFloat iconX = (i % 4) * iconW + DefaultMargin;
        CGFloat iconY = (i / 4) * iconH;
        iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }
    
    self.bounds = CGRectMake(0, 0, Width, (self.subviews.count / 4) * iconH);
}

- (void)clicked:(UITapGestureRecognizer *)tap {
    if (self.callback) {
        self.callback(HeadViewItemTypeHot,tap.view.tag);
    }
}

@end
