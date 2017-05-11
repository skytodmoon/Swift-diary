//
//  ShoppingViewController.m
//  爱鲜蜂(OC)
//
//  Created by 金亮齐 on 2017/5/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ShoppingViewController.h"
#import "DefaultView.h"
#import "ShoppingCell.h"
#import "TableFootView.h"
#import "AddressView.h"
#import "LightningView.h"
#import "UserShopCarTool.h"
@interface ShoppingViewController ()<UITableViewDelegate,UITableViewDataSource,TableFootViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DefaultView *defaultView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) TableFootView *footView;

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    [self bulidNotifacation];
    [self bulidTableView];
    [self bulidDefaultView];
    // Do any additional setup after loading the view.
}
- (void)bulidNotifacation{
    [Notification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
    [Notification addObserver:self selector:@selector(didRemoveGoods) name:LFBShopCarDidRemoveProductNSNotification object:nil];
    
}

- (void)IncreaseShoppingCart{
    self.footView.sumMoney = [[UserShopCarTool sharedInstance]getShopCarGoodsPrice];
}
- (void)didRemoveGoods{
    self.footView.sumMoney = [[UserShopCarTool sharedInstance]getShopCarGoodsPrice];
}

- (void)bulidTableView{
    self.tableView = ({
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.rowHeight = 80;
        tableview.backgroundColor = [UIColor clearColor];
        tableview;
    });
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self bulidTableHeadView];
    [self bulidTableFootView];
}

- (void)bulidTableHeadView{
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 100)];
    AddressView *address = [[AddressView alloc]initWithFrame:CGRectMake(0, 10, Width, 50)];
    LightningView *lightning = [[LightningView alloc]initWithFrame:CGRectMake(0, 70, Width, 30)];
    [self.headView addSubview:address];
    [self.headView addSubview:lightning];
    self.tableView.tableHeaderView = self.headView;
}
- (void)bulidTableFootView{
    _footView = [[TableFootView alloc]initWithFrame:CGRectMake(0, 0, Width, 50)];
    _footView.delegate = self;
    self.tableView.tableFooterView = _footView;
}
- (void)bulidDefaultView{
    _defaultView = [[DefaultView alloc]init];
    _defaultView.hidden = YES;
    [self.view addSubview:_defaultView];
    [_defaultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(170);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([[UserShopCarTool sharedInstance]isEmpty]) {
        self.defaultView.hidden = NO;
        self.tableView.hidden = YES;
    }else{
        self.defaultView.hidden = YES;
        self.tableView.hidden = NO;
        __weak typeof (self) weakSelf = self;
        [SVProgressHUD showWithStatus:@"加载中"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.dataList = [UserShopCarTool sharedInstance].shopCar;
            weakSelf.footView.sumMoney = [[UserShopCarTool sharedInstance]getShopCarGoodsPrice];
            [weakSelf.tableView reloadData];
            [SVProgressHUD dismiss];
        });
    }
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"ID";
    ShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ShoppingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.goods = self.dataList[indexPath.row];
    return cell;
}

- (void)didTableFootViewCommit{
    UIViewController *moneyVc = [[UIViewController alloc]init];
    moneyVc.view.backgroundColor = [UIColor whiteColor];
    moneyVc.title = [NSString stringWithFormat:@"%.2lf",[[UserShopCarTool sharedInstance]getShopCarGoodsPrice]];
    [self.navigationController pushViewController:moneyVc animated:YES];
}


@end
