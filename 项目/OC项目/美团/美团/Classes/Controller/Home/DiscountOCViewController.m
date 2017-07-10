//
//  DiscountOCViewController.m
//  美团
//
//  Created by 金亮齐 on 2017/7/10.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "DiscountOCViewController.h"
#import "DisTopicModel.h"

@interface DiscountOCViewController (){
    UILabel *_titleLabel;
    
    //
    UIImageView *_topicImage;
    
    
    //tableview数据源
    DisTopicModel *_topicData;
    NSMutableArray *_labelArray;
    NSMutableArray *_dealArray;
}

@end

@implementation DiscountOCViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
    [self setNav];
    [self initViews];
    // Do any additional setup after loading the view.
}

-(void)initData{
    _topicData = [[DisTopicModel alloc] init];
    _labelArray = [[NSMutableArray alloc] init];
    _dealArray = [[NSMutableArray alloc] init];
}

-(void)setNav{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    backView.backgroundColor = RGB(250, 250, 250);
    [self.view addSubview:backView];
    //下划线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, screen_width, 0.5)];
    lineView.backgroundColor = RGB(192, 192, 192);
    [backView addSubview:lineView];
    
    //返回
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 30, 23, 23);
    [backBtn setImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(OnBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backBtn];
    
    //标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2-80, 30, 160, 30)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = self.title;
    [backView addSubview:_titleLabel];
    
}

-(void)initViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.tableView];
    
}


-(void)OnBackBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
