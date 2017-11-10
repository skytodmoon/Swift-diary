//
//  SummaryListItem.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordsListView.h"

@interface SummaryListItem : UICollectionViewCell

@property (nonatomic,copy) NSString *urlString;

@property (nonatomic,assign) BOOL hasNotBeenUpdated;

@end
