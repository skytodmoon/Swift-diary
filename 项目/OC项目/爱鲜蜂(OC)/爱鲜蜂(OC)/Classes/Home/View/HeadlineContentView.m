//
//  HeadlineContentView.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HeadlineContentView.h"


@interface HeadlineContentView ()
@property (nonatomic, strong) UILabel *titLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation HeadlineContentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _titLabel = [[UILabel alloc]init];
        _titLabel.textColor = [UIColor redColor];
        _titLabel.font = [UIFont systemFontOfSize:12];
        _titLabel.layer.borderColor = [UIColor redColor].CGColor;
        _titLabel.layer.borderWidth = 1;
        _titLabel.layer.cornerRadius = 3;
        _titLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titLabel];
        
        _contentLabel = [[UILabel alloc]init];
        [_contentLabel sizeToFit];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1];
        [self addSubview:_contentLabel];
        
        [_titLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(18);
        }];
        [_contentLabel sizeToFit];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_titLabel.mas_trailing).offset(10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (void)setActRow:(ActRow *)actRow{
    self.titLabel.text = actRow.headline_detail.title;
    self.contentLabel.text = actRow.headline_detail.content;
}

@end
