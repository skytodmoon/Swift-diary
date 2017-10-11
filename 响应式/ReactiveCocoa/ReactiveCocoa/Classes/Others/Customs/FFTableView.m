//
//  FFTableView.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFTableView.h"

@interface FFTableView()

@property(nonatomic,strong) Class cellClass;

@end

@implementation FFTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame]) {
        self.tableView = [[UITableView alloc] initWithFrame:frame style:style];
        [self addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.tableFooterView = [UIView new];
        self.tableView.backgroundColor = [UIColor orangeColor];
    }
    return self;
}



-(void)registerCellClass:(Class)cellClass {
    self.cellClass = cellClass;
    [self.tableView registerClass:cellClass forCellReuseIdentifier:[cellClass description]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataSource.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.cellClass description]];
    FFViewModel *cellModel = self.viewModel.dataSource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.cellModel = cellModel;
    cell.indexPath = indexPath;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.viewModel.dataSource.count) {
        return;
    }
    FFViewModel *cellModel = self.viewModel.dataSource[indexPath.row];
    [self.viewModel.didSelectSubject sendNext:cellModel];
}

@end
