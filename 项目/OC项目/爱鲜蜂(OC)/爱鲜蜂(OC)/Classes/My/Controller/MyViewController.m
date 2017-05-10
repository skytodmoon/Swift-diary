//
//  MyViewController.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MyViewController.h"
#import "MineHeadView.h"

@interface MyViewController ()
@property (nonatomic,strong) NSArray *orderMenus;
@property (nonatomic,strong) NSArray *mineMenus;
@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) MineHeadView *mineHeadView;
@property (nonatomic,strong) UIView *footerView;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildHeadViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildHeadViews{
    
    self.mineHeadView = [[MineHeadView alloc]init];
    [self.view addSubview:self.mineHeadView];
    
    [self.mineHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.mas_equalTo(160);
    }];
}

@end
