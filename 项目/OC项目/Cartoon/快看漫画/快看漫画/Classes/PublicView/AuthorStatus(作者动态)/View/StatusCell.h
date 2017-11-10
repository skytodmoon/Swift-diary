//
//  StatusCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FeedsDataModel;
@class FeedsModel;

static NSString * const statusCellReuseIdentifier = @"StatusCell";

@interface StatusCell : UITableViewCell

@property (nonatomic,strong) FeedsModel *model;

@property (nonatomic,assign) BOOL showFollowBtn;


+ (StatusCell *)configureCellWithModel:(FeedsDataModel *)model
                           inTableView:(UITableView *)tableView
                           AtIndexPath:(NSIndexPath *)indexPath;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
