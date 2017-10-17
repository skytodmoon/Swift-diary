//
//  FFSpecialController.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFSpecialController.h"
#import "FFSpecialCell.h"
#import "FFSpecialViewModel.h"
#import "UIViewController+ViewModel.h"
#import "FFTableView.h"
#import "HUDTools.h"
#import "FFSpecialDetailController.h"
#import "FFRouter.h"

@interface FFSpecialController ()

@property (nonatomic, strong) FFTableView *mainView;

@end


@implementation FFSpecialController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];
    [self handleData];
    
}

- (void)handleData {
    @weakify(self)
    [RACObserve(self, viewModel) subscribeNext:^(FFSpecialViewModel *viewModel) {
        @strongify(self)
        [self.mainView registerCellClass:viewModel.cellClass];
        [HUDTools zj_showLoadingInView:self.view];
        
        @weakify(self)
        [[viewModel.requestSpecialList execute:nil] subscribeNext:^(FFSpecialViewModel *viewModel) {
            @strongify(self)
            [HUDTools zj_hideInView:self.view];
            self.mainView.viewModel = viewModel;
            [self.mainView.tableView reloadData];
            
            for (FFSpecialViewModel *tempModel in viewModel.dataSource) {
                @weakify(self)
                [tempModel.headerClickSubject subscribeNext:^(id x) {
                    @strongify(self)
                    FFSpecialDetailController *vc = [[FFSpecialDetailController alloc] initWithViewModel:nil];
                    [self.navigationController pushViewController:vc animated:YES];
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
