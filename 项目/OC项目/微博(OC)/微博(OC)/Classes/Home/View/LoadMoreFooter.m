//
//  LoadMoreFooter.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/12.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import "LoadMoreFooter.h"

@implementation LoadMoreFooter

//+(instancetype)footer{
//    
//    
//    return [[[NSBundle mainBundle] loadNibNamed:@"LoadMoreFooter" owner:nil options:nil] lastObject];
//    
//}

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UILabel *label = [[UILabel alloc]init];
        label.width = [UIScreen mainScreen].bounds.size.width;
        label.height = 44;
        label.text = @"加载更多内容";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:18 weight:2.0];
    
        [self addSubview:label];
    }
    
    return self;
}

@end
