//
//  SearchResultsCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class searchWordModel;

static CGFloat cellHeight = 80;

@interface SearchResultsCell : UITableViewCell

@property (nonatomic,strong) searchWordModel *model;

+ (instancetype)makeSearchResultsCellWithTableView:(UITableView *)tableView
                                    WithTopicModel:(searchWordModel *)md;

@end
