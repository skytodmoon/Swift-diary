//
//  WordsListView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordsListView : UITableView


@property (nonatomic,copy) NSString *urlString;

@property (nonatomic) BOOL hasTimeline;     

@property (nonatomic,copy) void (^NoDataCallBack)();

@property (nonatomic,assign) BOOL hasNotBeenUpdated;

@end
