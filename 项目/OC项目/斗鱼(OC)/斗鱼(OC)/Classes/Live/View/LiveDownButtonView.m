//
//  LiveDownButtonView.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "LiveDownButtonView.h"

@interface LiveDownButtonView ()

@end

@implementation LiveDownButtonView

+ (instancetype)downButtonView {
    return [[[NSBundle mainBundle] loadNibNamed:@"LiveDownButtonView" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    self.tagIconView.userInteractionEnabled = YES;
    self.tagNameLabel.userInteractionEnabled = YES;
    self.checkIconView.userInteractionEnabled = YES;
    
    self.tagIconView.layer.cornerRadius = self.tagIconView.width / 2;
    self.tagIconView.layer.masksToBounds = YES;
}

@end
