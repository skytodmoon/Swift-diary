//
//  QJLCommentHeaderView.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLCommentHeaderView.h"
#import "UIView+QJLExtension.h"
#import "QJLConst.h"

@interface QJLCommentHeaderView ()

/** 文字*/
@property (nonatomic, weak) UILabel *label;

@end

@implementation QJLCommentHeaderView

+(instancetype)headerViewTableView:(UITableView *)tableView {
    static NSString *ID = @"header";
    QJLCommentHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[self alloc] initWithReuseIdentifier:ID];
        
    }
    return header;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = QJLlobalBg;
        UILabel *label = [[UILabel alloc] init];
        label.x = QJLTopicCellMargin;
        label.width = 200;
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        label.textColor = QJLColor(67, 67, 67);
        [self.contentView addSubview:label];
        self.label = label;
    }
    return self;
}

-(void)setTitle:(NSString *)title {
    _title = title;
    self.label.text = title;
}

@end
