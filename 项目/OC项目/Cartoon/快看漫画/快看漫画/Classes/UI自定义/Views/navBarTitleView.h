//
//  navBarTitleView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface navBarTitleView : UIView

@property (nonatomic,weak,readonly) UIButton *leftBtn;

@property (nonatomic,weak,readonly) UIButton *rightBtn;

@property (nonatomic,copy) void (^leftBtnOnClick)(UIButton *btn);

@property (nonatomic,copy) void (^rightBtnOnClick)(UIButton *btn);

- (void)selectBtn:(UIButton *)btn;


+ (instancetype)defaultTitleView;

@end
