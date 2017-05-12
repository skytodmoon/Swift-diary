//
//  HomeHeadView.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeHeadView.h"

@implementation HomeHeadView
- (instancetype)initWithHeadData:(HomeHeadData *)headData{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    NSMutableArray *focusImages = [NSMutableArray array];
    NSMutableArray *iconImages = [NSMutableArray array];
    NSMutableArray *iconTitles = [NSMutableArray array];
    
    [headData.focus.act_rows enumerateObjectsUsingBlock:^(ActRow *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [focusImages addObject:obj.activity.img];
    }];
    
    [headData.icon.act_rows enumerateObjectsUsingBlock:^(ActRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [iconImages addObject:obj.activity.img];
        [iconTitles addObject:obj.activity.name];
    }];
    NSLog(@"iconImages = %@ headData.focus.act_rows= %@ focusImages = %@",iconImages,headData.focus.act_rows,focusImages);
    _scrollerView = [ScrollerPageView pageScroller:focusImages placeHolderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
    _scrollerView.backgroundColor = [UIColor orangeColor];
    _hotView = [[HotView alloc]initWithImages:iconImages title:iconTitles placeHolder:[UIImage imageNamed:@"v2_placeholder_square"] ];
    _headlineView = [[HeadLineView alloc]init];
    _headlineView.headline = headData.headline;
    
    [self addSubview:_headlineView];
    [self addSubview:_scrollerView];
    [self addSubview:_hotView];
    
    
    [_scrollerView layoutIfNeeded];
    [_hotView layoutIfNeeded];
    
    [_scrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.equalTo(self);
        make.trailing.equalTo(self);
        make.height.equalTo(self.mas_width).multipliedBy(0.37);
    }];
    [_hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollerView.mas_bottom);
        make.trailing.equalTo(self);
        make.leading.equalTo(self);
        make.height.mas_equalTo(_hotView.bounds.size.height);
    }];
    [_headlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_hotView.mas_bottom);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    
    NSLog(@"_headlineView.frame = %@",NSStringFromCGRect(_headlineView.frame));
    
    return self;
}

- (void)setHeight:(CGFloat)height{
    _height = height;
    [Notification postNotificationName:HomeTableHeadViewHeightDidChange object:[NSNumber numberWithFloat:_height]];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.height = CGRectGetMaxY(_headlineView.frame);
}

- (void)setCallback:(ClikedCallback)callback{
    self.hotView.callback = callback;
    self.scrollerView.clikeCall = callback;
    self.headlineView.callback = callback;
}

@end
