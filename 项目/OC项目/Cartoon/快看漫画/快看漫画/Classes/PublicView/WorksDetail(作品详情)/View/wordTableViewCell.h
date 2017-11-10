//
//  wordTableViewCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CartonnWordsModel.h"
#import "PrefixHeader.pch"

#define wordTableViewCellHeight 100

@interface wordTableViewCell : UITableViewCell

@property (nonatomic,strong) CartonnWordsModel *model;

@end
