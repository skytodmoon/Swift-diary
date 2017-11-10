//
//  wordsOptionsHeadView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefixHeader.pch"

#define wordsOptionsHeadViewHeight 40

@interface wordsOptionsHeadView : UIView

@property (nonatomic,weak,readonly) UIButton *leftBtn;

@property (nonatomic,weak,readonly) UIButton *rightBtn;

@property (nonatomic,copy) void (^lefeBtnClick)(UIButton *btn);

@property (nonatomic,copy) void (^rightBtnClick)(UIButton *btn);

@end
