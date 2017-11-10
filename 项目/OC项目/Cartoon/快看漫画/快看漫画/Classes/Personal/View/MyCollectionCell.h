//
//  MyCollectionCell.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/20.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionComicModel;

static NSString * const MyCollectionCellIdentifier = @"MyCollectionCellIdentifier";

@interface MyCollectionCell : UITableViewCell

@property (nonatomic,strong) CollectionComicModel *model;

+ (instancetype)makeMyCollectionCell;

@end
