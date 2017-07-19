//
//  NavMenu.m
//  美团iPad
//
//  Created by 金亮齐 on 2017/7/19.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NavMenu.h"

@implementation NavMenu

+(instancetype)navMenu{
    return [[[NSBundle mainBundle] loadNibNamed:@"NavMenu" owner:nil options:nil] lastObject];
}

//通过xib加载控件的时候调用
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.autoresizingMask = UIViewAutoresizingNone;
    }
    return self;
}
-(void)addTarget:(id)target action:(SEL)action{
    [self.clickBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
