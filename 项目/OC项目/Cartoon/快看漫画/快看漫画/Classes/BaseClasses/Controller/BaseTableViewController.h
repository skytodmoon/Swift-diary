//
//  BaseTableViewController.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/13.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseViewController.h"
#import "PrefixHeader.pch"
#import <Masonry.h>
#import <MJRefresh.h>

@interface BaseTableViewController : BaseViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak,readonly) UITableView *tableView;


- (void)updata;
- (void)loadMoreData;


@end
