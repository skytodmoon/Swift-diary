//
//  MyMessageCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReplyCommentsModel;

static NSString * const MyMessageCellIdentifier = @"MyMessageCellIdentifier";

@interface MyMessageCell : UITableViewCell

@property (nonatomic,strong) ReplyCommentsModel *model;

+ (instancetype)makeMyMessageCell;

@end
