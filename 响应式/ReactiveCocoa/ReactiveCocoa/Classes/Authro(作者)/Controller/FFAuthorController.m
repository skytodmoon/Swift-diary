//
//  FFAuthorController.m
//  ReactiveCocoa
//
//  Created by 金亮齐 on 2017/10/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "FFAuthorController.h"
#import "FFTableView.h"

@interface FFAuthorController()

@property(nonatomic,strong) FFTableView *mainView;

@end

@implementation FFAuthorController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainView];
}


- (FFTableView *)mainView {
    if (_mainView == nil) {
        _mainView = [[FFTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    }
    return _mainView;
}


@end
