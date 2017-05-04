
//
//  AlertView.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/14.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "AlertView.h"
#import "Header.h"

@implementation AlertView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setButtonImage:@"share1" buttonType:AlertViewBtnTypeWeChat];
        [self setButtonImage:@"share2" buttonType:AlertViewBtnTypeFriend];
        [self setButtonImage:@"share3" buttonType:AlertViewBtnTypeZone];
        [self setButtonImage:@"share4" buttonType:AlertViewBtnTypeQQ];
    }
    return self;
}

/**
 *  添加一个按钮
 *
 *  @param icon     默认图标
 *  @param highIcon 高亮图标
 */
- (UIButton *)setButtonImage:(NSString *)image buttonType:(AlertViewBtnType)btnType
{
    UIButton *button = [[UIButton alloc] init];
    button.tag = btnType;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //    button.backgroundColor = AYRandColor;
    [self addSubview:button];
    return button;
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(alertView:didSelectedBtn:)]) {
        [self.delegate alertView:self didSelectedBtn:button.tag];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    CGFloat buttonW = (self.width-100) / count ;
    CGFloat buttonH = buttonW;
    for (int i = 0; i<count; i++) {
        UIButton *button = self.subviews[i];
        button.y = 40;
        button.width = buttonW;
        button.height = buttonH;
        button.x = i * (buttonW+25) ;
    }
    
    
}


@end
