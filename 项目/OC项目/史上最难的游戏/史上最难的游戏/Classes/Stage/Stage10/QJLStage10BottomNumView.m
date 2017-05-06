//
//  QJLStage10BottomNumView.m
//  Game
//
//  Created by 金亮齐 on 16/8/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStage10BottomNumView.h"
#import "QJLStrokeLabel.h"
#import "PrefixHeader.pch"

@interface QJLStage10BottomNumView ()
{
    int _count1;
    int _count2;
    int _count3;
}

@property (nonatomic, strong) QJLStrokeLabel *label1;
@property (nonatomic, strong) QJLStrokeLabel *label2;
@property (nonatomic, strong) QJLStrokeLabel *label3;

@end

@implementation QJLStage10BottomNumView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat labelH = frame.size.height;
        self.label1 = [[QJLStrokeLabel alloc] initWithFrame:CGRectMake(0, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label1];
        
        self.label2 = [[QJLStrokeLabel alloc] initWithFrame:CGRectMake(labelH, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label2];
        
        self.label3 = [[QJLStrokeLabel alloc] initWithFrame:CGRectMake(labelH * 2, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label3];
    }
    
    return self;
}

- (void)buildLabelWithLabel:(QJLStrokeLabel *)label {
    [label setTextStorkeWidth:4];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"0";
    label.font = [UIFont fontWithName:@"TransformersMovie" size:kFontSize];
    [self addSubview:label];
}

- (void)addNumWithIndex:(int)index {
    switch (index) {
        case 0:
            _count1++;
            self.label1.text = [NSString stringWithFormat:@"%d", _count1];
            break;
        case 1:
            _count2++;
            self.label2.text = [NSString stringWithFormat:@"%d", _count2];
            break;
        case 2:
            _count3++;
            self.label3.text = [NSString stringWithFormat:@"%d", _count3];
            break;
        default:
            break;
    }
}

- (void)cleanData {
    _count1 = 0;
    _count2 = 0;
    _count3 = 0;
    self.label1.text = @"0";
    self.label2.text = @"0";
    self.label3.text = @"0";
}



@end
