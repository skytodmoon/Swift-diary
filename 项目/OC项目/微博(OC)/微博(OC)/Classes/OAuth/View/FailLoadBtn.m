//
//  FailLoadBtn.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FailLoadBtn.h"
#define FailLoadBtnPadding 8
@implementation FailLoadBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *info = @"网络出现故障。\n请检查网络连接，然后点击左上角刷新按钮。\n\n建议检查步骤：\n1. 请确认你所在位置的移动信号良好。\n2. WiFi：设置-WiFi-打开WiFi开关-选取网络，选择可连接互联网的WiFi。\n3. 蜂窝网络：设置-蜂窝移动网络-打开蜂窝移动网络开关。\n4. 请检查是不是没话费了哦亲~";
        [self setTitle:info forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = FailLoadBtnFont;
        self.layer.cornerRadius = 3;
        self.userInteractionEnabled = NO;
        self.contentEdgeInsets = UIEdgeInsetsMake(FailLoadBtnPadding,
                                                  FailLoadBtnPadding,
                                                  FailLoadBtnPadding ,
                                                  FailLoadBtnPadding);
        
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 41 * 2, MAXFLOAT);
        CGSize textSize = [info sizeWithFont:FailLoadBtnFont constrainedToSize:maxSize];
        CGSize btnSize = CGSizeMake(textSize.width + FailLoadBtnPadding * 2, textSize.height + FailLoadBtnPadding * 2);
        self.bounds = CGRectMake(0, 0, btnSize.width, btnSize.height);
        self.backgroundColor = Color(246, 246, 246);
    }
    return self;
}

@end
