//
//  ShopViewController.m
//  美团
//
//  Created by 金亮齐 on 2017/7/4.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ShopViewController.h"
#import "ShopInfoModel.h"

@interface ShopViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel *_titleLabel;
    UIActivityIndicatorView *_activityView;
    
    //数据源
    ShopInfoModel *_shopInfoM;
    
    NSString *_recommendTitle;
    NSMutableArray *_shopRecommendArray;
}

@end

@implementation ShopViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    [self setNav];
    [self initView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getShopData];
        [self getShopRecommendData];
    });
    // Do any additional setup after loading the view.
}
-(void)initData{
    _shopInfoM = [[ShopInfoModel alloc]init];
    _shopRecommendArray = [[NSMutableArray alloc]init];
}
-(void)setNav{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    backView.backgroundColor = RGB(250, 250, 250);
    [self.view addSubview:backView];
    
    //下划线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 63.5, screen_width, 0.5)];
    lineView.backgroundColor = RGB(192, 192, 192);
    [backView addSubview:lineView];
    
    //返回
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 20, 44, 44);
    [backBtn setImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backBtn];
    
    //收藏
    UIButton *collecBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collecBtn.frame = CGRectMake(screen_width-44, 20, 44, 44);
    [collecBtn setImage:[UIImage imageNamed:@"icon_collect"] forState:UIControlStateNormal];
    [collecBtn setImage:[UIImage imageNamed:@"icon_collect_highlighted"] forState:UIControlStateHighlighted];
    [backView addSubview:collecBtn];
    
    //分享
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(screen_width-66, 30, 22, 22);
    [shareBtn setImage:[UIImage imageNamed:@"icon_merchant_share_normal"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"icon_merchant_share_highlighted"] forState:UIControlStateHighlighted];
    [shareBtn addTarget:self action:@selector(OnShareBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:shareBtn];
    
}
-(void)initView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.hidden = YES;
    
    _activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(screen_width/2-15, screen_height/2-15, 30, 30)];
    _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _activityView.hidesWhenStopped = YES;
    [self.view addSubview:_activityView];
    [self.view bringSubviewToFront:_activityView];
}

#pragma makr - 点击事件
-(void)OnBackBtn:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)OnShareBtn:(UIButton *)sender{
    
}

#pragma mark - 请求数据
-(void)getShopData{
    
}
-(void)getShopRecommendData{
    
}
@end
