//
//  GameCell.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/8.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "GameCell.h"
#import "GameVerticalButton.h"
#import "Tag.h"

@implementation GameCell

- (void)setAllTags:(NSArray *)allTags {
    _allTags = allTags;
    
    // 设置所有的button的frame
    CGFloat btnW = GameBtnW;
    CGFloat btnH = GameBtnH;
    CGFloat margin = GameBtnMargin;
    CGFloat btnMargin = (self.width - 2 * margin - 3 * btnW ) / 2;
    for (int i = 0; i < allTags.count; i++) {
        Tag *tag = allTags[i];
        CGFloat btnX = 20 + (i % 3) * ( btnW + btnMargin);
        CGFloat btnY = margin + (i / 3) * (btnH + 2 * margin);
        GameVerticalButton *btn = [[GameVerticalButton alloc] init];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setTitle:tag.tag_name forState:UIControlStateNormal];
        [btn sd_setImageWithURL:[NSURL URLWithString:tag.icon_url] forState:UIControlStateNormal];
        [self addSubview:btn];
        
        UIView *divider = [[UIView alloc] init];
        divider.alpha = 0.1;
        divider.frame = CGRectMake(20, btnY + btnH - 1 + 20, self.width - 40, 1);
        divider.backgroundColor = [UIColor grayColor];
        [self addSubview:divider];
    }
}

@end
