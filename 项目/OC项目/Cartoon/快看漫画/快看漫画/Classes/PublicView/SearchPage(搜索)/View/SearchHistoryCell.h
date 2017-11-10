//
//  SearchHistoryCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchHistoryCell : UITableViewCell

@property (nonatomic,copy) NSString *history;

@property (nonatomic,copy) void (^deleteBtnOnClick)(SearchHistoryCell *cell);


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
