//
//  FFTableView.h
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFTableView : UIView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;

-(void)registerCellClass:(Class)cellClass;

@end
