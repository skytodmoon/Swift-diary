//
//  HomeViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [super viewDidLoad];
    
    [self setNav];
    
    [self initTableView];
    // Do any additional setup after loading the view.
}

-(void)setNav{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 98)];
    backView.backgroundColor = navigationBarColor;
    [self.view addSubview:backView];
    
    //声明：原创所有，不要注释下面的UIButton
    UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nameBtn.frame = CGRectMake(10, 20, 60, 40);
    nameBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [nameBtn setTitle:@"点击这" forState:UIControlStateNormal];
    [nameBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nameBtn addTarget:self action:@selector(OnNameBtn) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:nameBtn];
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2-80, 20, 160, 30)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"百度传课";
    titleLabel.font = [UIFont systemFontOfSize:19];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:titleLabel];
    //搜索
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(screen_width-10-40, 20, 40, 40);
    [searchBtn setImage:[UIImage imageNamed:@"search_btn_unpre_bg"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(OnSearchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:searchBtn];
    
    //
    NSArray *segmentArray = [[NSArray alloc] initWithObjects:@"精选推荐",@"课程分类", nil];
    UISegmentedControl *segmentCtr = [[UISegmentedControl alloc] initWithItems:segmentArray];
    segmentCtr.frame = CGRectMake(36, 64, screen_width-36*2, 30);
    segmentCtr.selectedSegmentIndex = 0;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:15],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    [segmentCtr setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [segmentCtr setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    segmentCtr.tintColor = RGB(46, 158, 138);
    [segmentCtr addTarget:self action:@selector(OnTapSegmentCtr:) forControlEvents:UIControlEventValueChanged];
    [backView addSubview:segmentCtr];
}

-(void)OnNameBtn{
    UIAlertView *alertVC = [[UIAlertView alloc] initWithTitle:@"关于作者" message:@"作者：QJL，QQ：274721774，例子说明，转载请注明出处，不可用于商业用途及其他不合法用途。" delegate:self cancelButtonTitle:@"同意" otherButtonTitles:nil, nil];
    [alertVC show];
}


-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 98, screen_width, screen_height-98-49) style:UITableViewStylePlain];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    /***   添加下拉刷新 */
    QJLRefresh *refresh = [QJLRefresh headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_header = refresh;

}


-(void)loadNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getRecommendData];
        [_tableView.mj_header endRefreshing];
    });
    

}


//请求推荐课程数据
-(void)getRecommendData{

    
}

@end
