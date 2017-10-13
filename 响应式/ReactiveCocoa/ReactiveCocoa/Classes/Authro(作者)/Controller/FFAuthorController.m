//
//  FFAuthorController.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFAuthorController.h"
#import "FFTableView.h"
#import "FFAuthorViewModel.h"
#import "FFAuthorCell.h"
#import "UIView+FFAdd.h"
#import "HUDTools.h"
#import "UITableViewCell+FFAdd.h"
#import "FFAuthorDetailController.h"
#import "FFSpecialDetailController.h"
#import "UIViewController+ViewModel.h"
#import "FFRouter.h"

@interface FFAuthorController()

@property(nonatomic,strong) FFTableView *mainView;

@end

@implementation FFAuthorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];
    @weakify(self)
    [RACObserve(self, viewModel) subscribeNext:^(FFAuthorViewModel *viewModel) {
        @strongify(self)
        [self.mainView registerCellClass:[FFAuthorCell class]];
        [HUDTools zj_showLoadingInView:self.view];
        @weakify(self)
        [[viewModel.requestAuthorList execute:nil] subscribeNext:^(FFAuthorViewModel *viewModel) {
            @strongify(self)
            [HUDTools zj_hideInView:self.view];
            self.mainView.viewModel = viewModel;
            [self.mainView.tableView reloadData];
            
            for (FFAuthorViewModel *tempModel in viewModel.dataSource) {
                @weakify(self)
                [tempModel.goodTopicClickSubject subscribeNext:^(id x) {
                    @strongify(self)
                    FFSpecialDetailController *detailVC = [[FFSpecialDetailController alloc] initWithViewModel:nil];
                    [self.navigationController pushViewController:detailVC animated:YES];
                }];
            }
        } error:^(NSError *error) {
            [HUDTools zj_showErrorStatusInView:self.view title:@"Request Error!"];
        }];
        
        [viewModel.didSelectSubject subscribeNext:^(id x) {
            @strongify(self)
            UIViewController *controller = [[FFRouter sharedInstance] controllerForViewModel:x];
            [self.navigationController pushViewController:controller animated:YES];
        }];
        
    }];
}


- (FFTableView *)mainView {
    if (_mainView == nil) {
        _mainView = [[FFTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    }
    return _mainView;
}


@end
