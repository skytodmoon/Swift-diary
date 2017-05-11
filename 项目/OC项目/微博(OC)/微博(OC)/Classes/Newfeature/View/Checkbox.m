//
//  Checkbox.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "Checkbox.h"

#define CheckboxTitleSize 13.0

@implementation Checkbox

+ (instancetype)checkboxWithTitle:(NSString *)title
{
    return [[self alloc] initWithTitle:title];
}

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        UIImage *image = [UIImage imageNamed:@"new_feature_share_false"];
        [self setImage:image forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:Color(92, 98, 103) forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:CheckboxTitleSize];
        
        CGFloat padding = 5;
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = [UIFont fontWithName:@"HelveticaNeue" size:CheckboxTitleSize];
        CGSize titleSize = [title sizeWithAttributes:attributes];
        CGFloat checkW = titleSize.width + image.size.width + padding * 2;
        self.bounds = (CGRect){CGPointZero, checkW, image.size.height};
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, padding);
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
