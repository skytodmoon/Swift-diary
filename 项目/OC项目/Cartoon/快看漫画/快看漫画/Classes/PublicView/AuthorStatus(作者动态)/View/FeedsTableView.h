//
//  FeedsTableView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, catalog_type) {
    usersConcernedData = 0,
    newsData = 1,
    hotData  = 2,
};

@interface FeedsTableView : UITableView

- (void)updateWithDataType:(catalog_type)dataType;

@end
