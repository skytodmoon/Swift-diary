//
//  StatusCell.m
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "StatusCell.h"
#import "Status.h"
#import "StatusFrame.h"
#import "User.h"
#import "UIImageView+WebCache.h"
#import "StatusToolBar.h"
#import "StatusTopView.h"

@interface StatusCell ()

/** 微博的topView */
@property (nonatomic, weak) StatusTopView *topView;
/** 微博工具条 */
@property (nonatomic, weak) StatusToolBar *statusToolBar;

@end

@implementation StatusCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - 重写setFrame:方法

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = StatusPadding * 0.5;
    frame.size.width -= StatusPadding;
    frame.origin.y += StatusPadding * 0.5;
    frame.size.height -= StatusPadding * 0.5;
    
    [super setFrame:frame];
}

#pragma mark - 初始化

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectedBackgroundView = [[UIView alloc] init];
        
        // 初始化微博的topView
        [self setupTopView];
        
        // 初始化微博工具条
        [self setupToolBar];
    }
    return self;
}

/**
 *  初始化微博的topView
 */
- (void)setupTopView
{
    StatusTopView *topView = [[StatusTopView alloc] init];
    [self.contentView addSubview:topView];
    self.topView = topView;
}

/**
 *  初始化微博工具条
 */
- (void)setupToolBar
{
    StatusToolBar *statusToolBar = [[StatusToolBar alloc] init];
    [self.contentView addSubview:statusToolBar];
    self.statusToolBar = statusToolBar;
}

#pragma mark - 设置数据

- (void)setStatusFrame:(StatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 设置原创微博数据和frame
    [self setupTopViewData];
    
    // 设置微博工具条数据和frame
    [self setupToolBarData];
}

/**
 *  设置原创微博数据和frame
 */
- (void)setupTopViewData
{
    StatusFrame *statusFrame = self.statusFrame;
    
    // 传递数据和布局
    self.topView.statusFrame = statusFrame;
    self.topView.frame = statusFrame.originalViewF;
}

/**
 *  设置微博工具条数据和frame
 */
- (void)setupToolBarData
{
    self.statusToolBar.frame = self.statusFrame.statusToolBarF;
    self.statusToolBar.status = self.statusFrame.status;
}


@end
