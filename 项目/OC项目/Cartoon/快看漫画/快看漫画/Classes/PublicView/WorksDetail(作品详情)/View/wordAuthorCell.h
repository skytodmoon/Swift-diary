//
//  wordAuthorCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PrefixHeader.pch"

@class userModel;

#define wordAuthorCellHeight 50

@interface wordAuthorCell : UITableViewCell

@property (nonatomic,strong) userModel *model;

@end
