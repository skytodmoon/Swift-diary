//
//  HomeCateViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeCateViewController.h"
#import "DetailAllCourseCell.h"
#import "HomeCourseDetailViewController.h"

@interface HomeCateViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _type;/**< segment */
    
    NSInteger _page;/**< 页数 */
    NSInteger _limit;/**< 每页的个数 */
    NSInteger _charge;/**< 1：免费；2：收费 */
    
    NSString *_cateid;/**< 课程分类ID */
    
    NSMutableArray *_dataSourceArray;
    
    UIView *_lineView;
    NSInteger _currentIndex;/**< 记录当前课程分类按钮的下标 */
}


@end

@implementation HomeCateViewController

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
    [self getAllCourseData];
    // Do any additional setup after loading the view.
}

-(void)initData{
    _dataSourceArray = [[NSMutableArray alloc] init];
    _page = 1;
    _limit = 20;
    _charge = 1;
    _currentIndex = 0;
    if ([self.cateType isEqualToString:@"feizhibo"]) {
        _cateid = self.cateIDArray[0];
    }
}

-(void)setNav{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 64)];
    backView.backgroundColor = navigationBarColor;
    [self.view addSubview:backView];
    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 20, 40, 40);
    [backBtn setImage:[UIImage imageNamed:@"file_tital_back_but"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(OnTapBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:backBtn];
    
    NSArray *segmentArray = [[NSArray alloc] initWithObjects:@"免费",@"收费", nil];
    UISegmentedControl *segmentCtr = [[UISegmentedControl alloc] initWithItems:segmentArray];
    segmentCtr.frame = CGRectMake(screen_width/2-80, 30, 160, 30);
    segmentCtr.selectedSegmentIndex = 0;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:15],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    [segmentCtr setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [segmentCtr setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    segmentCtr.tintColor = RGB(46, 158, 138);
    [segmentCtr addTarget:self action:@selector(OnTapSegmentCtr:) forControlEvents:UIControlEventValueChanged];
    [backView addSubview:segmentCtr];
}

//响应事件
-(void)OnTapBackBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)OnTapSegmentCtr:(UISegmentedControl *)seg{
    NSInteger index = seg.selectedSegmentIndex;
    if (index == 0) {
        _page = 1;
        _charge = 1;
    }else{
        _page = 1;
        _charge = 2;
    }
    
    [self.tableView reloadData];
}

-(void)OnTapNameBtn:(UIButton *)sender{
    NSInteger index = sender.tag - 10;
    if (index == _currentIndex) {
        return;
    }
    _currentIndex = index;
    _cateid = _cateIDArray[index];
    _page = 1;
    [UIView animateWithDuration:0.5 animations:^{
        _lineView.center = CGPointMake(sender.center.x, 39);
    }];
    //刷新数据
    [self.tableView reloadData];
}


-(void)initViews{
    if ([self.cateType isEqualToString:@"zhibo"]) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64) style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:self.tableView];
    }else{
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, screen_width, 40)];
        scrollView.pagingEnabled = NO;
        scrollView.alwaysBounceHorizontal = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.backgroundColor = RGB(246, 246, 246);
        [self.view addSubview:scrollView];
        
        float btnWidth = 60;
        
        for (int i = 0; i < self.cateNameArray.count; i++) {
            UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            nameBtn.frame = CGRectMake(btnWidth*i, 0, btnWidth, 40);
            nameBtn.tag = 10+i;
            nameBtn.font = [UIFont systemFontOfSize:13];
            [nameBtn setTitle:self.cateNameArray[i] forState:UIControlStateNormal];
            [nameBtn setTitleColor:navigationBarColor forState:UIControlStateSelected];
            [nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [nameBtn addTarget:self action:@selector(OnTapNameBtn:) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:nameBtn];
            if (i == 0) {
                _lineView = [[UIView alloc] initWithFrame:CGRectMake(nameBtn.center.x-20, 38, 40, 2)];
                _lineView.backgroundColor = navigationBarColor;
                [scrollView addSubview:_lineView];
            }
        }
        scrollView.contentSize = CGSizeMake(self.cateNameArray.count*btnWidth, 0);
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64+40, screen_width, screen_height-64-40) style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:self.tableView];
    }
    /***   添加下拉刷新 */
    QJLRefresh *HeaderRefresh = [QJLRefresh headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_header = HeaderRefresh;
    
//    QJLRefresh *foot = [QJLRefresh footerWithRefreshingTarget: self refreshingAction:@selector(loadMoreData)];
//    _tableView.mj_footer = foot;
}

-(void)loadNewData{
    _page = 1;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getAllCourseData];
    });
}

-(void)loadMoreData{
    _page++;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getAllCourseData];
    });
}

-(void)getAllCourseData{
    
    NSString *urlStr = @"";
    if ([self.cateType isEqualToString:@"zhibo"]) {
        urlStr = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=search&act=mobile&from=iPhone&page=%ld&limit=%ld&today=1&charge=%ld",_page,_limit,_charge];
    }else{
        urlStr = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=search&act=mobile&from=iPhone&page=%ld&limit=%ld&cateid=%@&charge=%ld",_page,_limit,_cateid,_charge];
    }
    __weak typeof(self) weakself = self;
    
    [[Networking sharedManager] getDataResult:nil url:urlStr successBlock:^(id responseBody){
        
        if (_page == 1) {
            [_dataSourceArray removeAllObjects];
        }
        
        NSMutableArray *ClassListArray = [responseBody objectForKey:@"ClassList"];
        for (int i = 0; i < ClassListArray.count; i++) {
            DetailCateModel *jzCateM = [DetailCateModel mj_objectWithKeyValues:ClassListArray[i]];
            [_dataSourceArray addObject:jzCateM];
        }
        
        
        [weakself.tableView reloadData];
        [weakself.tableView.mj_header endRefreshing];
        [weakself.tableView.mj_footer endRefreshing];
    } failureBlock:^(NSString *error){
        [SVProgressHUD showErrorWithStatus:@"网络繁忙,请重新加载"];
        [weakself.tableView.mj_header endRefreshing];
        [weakself.tableView.mj_footer endRefreshing];
    }];

    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourceArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 74;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"allcourseCell";
    DetailAllCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[DetailAllCourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        //下划线
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 73.5, screen_width, 0.5)];
        lineView.backgroundColor = separaterColor;
        [cell addSubview:lineView];
    }
    
    DetailCateModel *jzCateM = _dataSourceArray[indexPath.row];
    [cell setJzCateM:jzCateM];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailCateModel *jzCateM = _dataSourceArray[indexPath.row];
    HomeCourseDetailViewController *jzCourseDVC = [[HomeCourseDetailViewController alloc] init];
    jzCourseDVC.SID = jzCateM.SID;
    jzCourseDVC.courseId = jzCateM.CourseID;
    [self.navigationController pushViewController:jzCourseDVC animated:YES];
}


@end
