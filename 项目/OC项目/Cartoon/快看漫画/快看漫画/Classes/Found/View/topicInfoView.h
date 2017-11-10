//
//  topicInfoView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class topicModel;

static CGFloat spaceing = 10;

@interface topicInfoView : UIView

@property (nonatomic,strong) topicModel *model;

+ (void)jiuGongGeLayout:(NSArray<topicInfoView *> *)views WithMaxSize:(CGSize)maxSize WithRow:(NSInteger)row;

@end
