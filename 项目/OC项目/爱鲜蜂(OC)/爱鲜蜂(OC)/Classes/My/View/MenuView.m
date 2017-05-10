//
//  MenuView.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MenuView.h"
#import "TitleIconView.h"

/** 一行显示的个数  */
static const NSInteger DefaultRowNumbers = 4;

@interface MenuView()
@property (nonatomic,copy) NSArray<TitileIconAction *> *menus;
@property (nonatomic) BOOL showLine;
@end

@implementation MenuView


- (instancetype)initMenus:(NSArray<TitileIconAction *> *)menus WithLine:(BOOL)showLine {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.menus = menus;
        for (TitileIconAction *menu in menus) {
            TitleIconView *titleIconView = [[TitleIconView alloc]initWithTitleLabel:menu.title icon:menu.icon boder:showLine];
            titleIconView.userInteractionEnabled = YES;
            titleIconView.tag = menu.tag;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleIconViewCliked)];
            [titleIconView addGestureRecognizer:tap];
            [self addSubview:titleIconView];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat viewW = self.bounds.size.width / DefaultRowNumbers;
    CGFloat viewH = self.bounds.size.height / (self.menus.count / DefaultRowNumbers);
    
    for (NSInteger i = 0;i < self.subviews.count;i++) {
        TitleIconView *titleIconView = self.subviews[i];
        CGFloat viewX = (i % DefaultRowNumbers )* viewW;
        CGFloat viewY = (i / DefaultRowNumbers) * viewH;
        titleIconView.frame = CGRectMake(viewX,viewY, viewW,viewH);
    }
}
- (void)titleIconViewCliked {
    
}
@end
