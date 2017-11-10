//
//  AuthorTopicInfoCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class topicModel;

static NSString * const AuthorTopicInfoCellReuseIdentifier = @"AuthorTopicInfoCell";

static CGFloat AuthorTopicInfoCellHeight = 120.0f;

@interface AuthorTopicInfoCell : UITableViewCell

@property (nonatomic,strong) topicModel *model;

@end
