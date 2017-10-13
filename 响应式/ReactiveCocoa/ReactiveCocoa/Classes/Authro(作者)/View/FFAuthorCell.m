//
//  FFAuthorCell.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFAuthorCell.h"
#import "FFAuthorViewModel.h"
#import "UITableViewCell+FFAdd.h"

@interface FFAuthorCell ()

/// 作者
@property (nonatomic, strong) UILabel *authorLabel;
/// 头像
@property (nonatomic, strong) UIImageView *headImgView;
/// 认证
@property (nonatomic, strong) UIImageView *authImgView;
/// 擅长专题
@property (nonatomic, strong) UIButton *goodTopic;
/// 当前第几名
@property (nonatomic, strong) UILabel *sortLabel;
/// 底部的线
@property (nonatomic, strong) UIView *lineView;

@end

@implementation FFAuthorCell

#pragma mark - init method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
        [self setLayout];
        [self handleData];
        
    }
    return self;
}

#pragma mark - ui & layout
- (void)setupUI{
    
    [self.contentView addSubview:self.headImgView];
    [self.contentView addSubview:self.authImgView];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.goodTopic];
    [self.contentView addSubview:self.sortLabel];
    [self.contentView addSubview:self.lineView];
    
    [self.goodTopic addTarget:self action:@selector(s_goodTapicTapEvent) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setLayout{
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(FFCellMarginLeft * 2);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@(FFHeaderImageHeight));
    }];
    
    [self.authImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(FFAuthIconHeight));
        make.bottom.right.equalTo(self.headImgView);
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(FFCellMarginLeft);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.sortLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-FFCellMarginLeft * 2);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.goodTopic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(FFDescLabelLessMarginRight + FFCellMarginRight * 2);
        make.centerY.equalTo(self.authorLabel);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView.mas_bottom).offset(FFCellMarginTop);
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(FFCellLineHeight);
    }];
    
}

#pragma mark - handle data
- (void)handleData {
    
    @weakify(self)
    [RACObserve(self, cellModel) subscribeNext:^(FFAuthorViewModel *viewModel) {
        @strongify(self)
        [self.headImgView yy_setImageWithURL:[NSURL URLWithString:viewModel.headImg] placeholder:[UIImage imageNamed:@"pc_default_avatar"]];
        self.authorLabel.text = viewModel.userName;
        self.sortLabel.text = viewModel.sortNum;
        if (viewModel.authIconName) {
            self.authImgView.image = [UIImage imageNamed:viewModel.authIconName];
        }
        [[self.goodTopic rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [viewModel.goodTopicClickSubject sendNext:x];
        }];
    }];
}

#pragma mark - handle event
- (void)s_goodTapicTapEvent {
    NSLog(@"XXXX");
}

#pragma mark - getter
- (UILabel *)authorLabel{
    if (_authorLabel == nil) {
        _authorLabel = [[UILabel alloc]init];
        [_authorLabel text:nil textColor:kHexColor_555 fontSize:FONT_SIZE_14 fontName:FONT_FAMILY_CODE_LIGHT];
    }
    return _authorLabel;
}

- (UIImageView *)headImgView{
    if (_headImgView == nil) {
        _headImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pc_default_avatar"]];
        _headImgView.layer.cornerRadius = FFHeaderImageHeight * 0.5;
        _headImgView.layer.masksToBounds = YES;
        _headImgView.layer.borderWidth = 0.5;
        _headImgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _headImgView.userInteractionEnabled = YES;
    }
    return _headImgView;
}

- (UIImageView *)authImgView{
    if (_authImgView == nil) {
        _authImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personAuth"]];
    }
    return _authImgView;
}

- (UIButton *)goodTopic {
    if (_goodTopic == nil) {
        _goodTopic = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goodTopic setTitle:@"[ 擅长话题 ]" forState:UIControlStateNormal];
        [_goodTopic setTitleColor:kHexColor_c7a762 forState:UIControlStateNormal];
        _goodTopic.titleLabel.font = [UIFont fontWithName:FONT_FAMILY_CODE_LIGHT size:FONT_SIZE_14];
    }
    return _goodTopic;
}

- (UILabel *)sortLabel{
    if (_sortLabel == nil) {
        _sortLabel = [[UILabel alloc]init];
        [_sortLabel text:nil textColor:kHexColor_000 fontSize:FONT_SIZE_25 fontName:FONT_FAMILY_CODE_LIGHT];
        
    }
    return _sortLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = kHexColor_e1e4e8;
    }
    return _lineView;
}


@end
