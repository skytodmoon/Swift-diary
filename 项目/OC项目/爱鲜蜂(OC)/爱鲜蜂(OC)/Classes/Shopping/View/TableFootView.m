//
//  TableFootView.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "TableFootView.h"

@interface TableFootView ()
@property (nonatomic, strong) UILabel *money;
@property (nonatomic, strong) UIButton *commitBtn;
@end
@implementation TableFootView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _money = [[UILabel alloc]init];
        _money.font = [UIFont systemFontOfSize:15];
        _money.textColor = [UIColor redColor];
        [self addSubview:_money];
        
        _commitBtn = [[UIButton alloc]init];
        [_commitBtn setTitle:@"选好了" forState:UIControlStateNormal];
        [_commitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_commitBtn addTarget:self action:@selector(commitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _commitBtn.backgroundColor = GeneralColor;
        [self addSubview:_commitBtn];
        
        [_money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.width.equalTo(@100);
            make.leading.equalTo(self).offset(15);
            make.height.equalTo(@15);
        }];
        [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.trailing.equalTo(self);
            make.height.equalTo(self);
            make.width.equalTo(@100);
        }];
    }
    return self;
}
- (void)setSumMoney:(CGFloat)sumMoney{
    _sumMoney = sumMoney;
    self.money.text = [NSString stringWithFormat:@"共 ￥%.2lf",sumMoney];
}
- (void)commitBtnClick{
    if ([self.delegate respondsToSelector:@selector(didTableFootViewCommit)] ) {
        [self.delegate didTableFootViewCommit];
    }
}


@end
