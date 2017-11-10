//
//  wordsSequenceView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PrefixHeader.pch"

#define wordsSequenceViewHeight 40

@interface wordsSequenceView : UIView

//选中状态为正序,反之倒序

@property (nonatomic,weak,readonly) UIButton *sortBtn;

@end
