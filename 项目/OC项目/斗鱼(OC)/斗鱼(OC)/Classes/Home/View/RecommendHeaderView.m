//
//  RecommendHeaderView.m
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "RecommendHeaderView.h"
#import "MoreButton.h"

@interface RecommendHeaderView ()

@property (nonatomic,weak) UIImageView *iconView;

@property (nonatomic,weak) UILabel *tagLabel;

@property (nonatomic,weak) MoreButton *moreBtn;

@end

@implementation RecommendHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor whiteColor];
    // 最左边的图标
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.contentMode = UIViewContentModeCenter;
    [self addSubview:iconView];
    self.iconView = iconView;
    
    // 标签文字
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:tagLabel];
    self.tagLabel = tagLabel;
    
    // 添加更多按钮
    MoreButton *moreBtn = [[MoreButton alloc] init];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn setImage:[UIImage imageNamed:@"dyla_右箭头_16x16_"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(clickHeaderView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
    self.moreBtn = moreBtn;
}

- (void)setHideMoreBtn:(BOOL)hideMoreBtn {
    self.moreBtn.hidden = hideMoreBtn;
}

- (void)clickHeaderView {
    NSLog(@"点击的标签名字是:   %@", self.tagName);
}

- (void)setImageName:(NSString *)imageName {
    _imageName = [imageName copy];
    self.iconView.image = [UIImage imageNamed:imageName];
}

- (void)setTagName:(NSString *)tagName {
    _tagName = [tagName copy];
    self.tagLabel.text = tagName;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconView.frame = CGRectMake(10, 5, 20, 20);
    self.tagLabel.frame = CGRectMake(30, 0, 100, 30);
    self.moreBtn.frame = CGRectMake(self.width - 50, 5, 45, 25);
}

@end
