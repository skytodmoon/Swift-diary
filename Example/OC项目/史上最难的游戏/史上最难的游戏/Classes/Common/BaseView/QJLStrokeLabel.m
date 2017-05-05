//
//  QJLStrokeLabel.m
//  Game
//
//  Created by 金亮齐 on 16/7/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLStrokeLabel.h"

@interface QJLStrokeLabel ()

@property (nonatomic, assign) CGFloat storwidth;
@property (nonatomic, strong) UIColor *borderDrawColor;

@end

@implementation QJLStrokeLabel

- (instancetype)init {
    if (self = [super init]) {
        self.storwidth = 6;
        self.borderDrawColor = [UIColor blackColor];
    }
    
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(c, self.storwidth);
    CGContextSetLineJoin(c, kCGLineJoinRound);
    
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    self.textColor = self.borderDrawColor;
    [super drawTextInRect:rect];
    
    CGContextSetTextDrawingMode(c, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    
    self.shadowOffset = shadowOffset;
}

- (void)setTextStorkeWidth:(CGFloat)width {
    _storwidth = width;
    [self setNeedsDisplay];
}

- (void)setBorderDrawColor:(UIColor *)borderColor {
    _borderDrawColor = borderColor;
    [self setNeedsDisplay];
}



@end
