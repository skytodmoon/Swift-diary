//
//  AuthorShareInfoCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AuthorInfoModel;

static NSString * const AuthorShareInfoCellIdentifier = @"AuthorShareInfoCellIdentifier";

static CGFloat const AuthorShareInfoCellHeight = 40;

@interface AuthorShareInfoCell : UITableViewCell

@property (nonatomic,copy,readonly) NSString *text;

- (void)setText:(NSString *)text atIndex:(NSInteger)index;

@end
