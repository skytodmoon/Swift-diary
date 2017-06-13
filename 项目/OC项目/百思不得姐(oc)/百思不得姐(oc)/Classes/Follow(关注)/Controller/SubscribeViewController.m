//
//  SubscribeViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import "SubscribeViewController.h"
#import "RecommendCell.h"
#import "RecommendItem.h"


//定义标识
static NSString *const ID = @"cell";

@interface SubscribeViewController ()
//模型数组
@property (nonatomic,strong) NSArray *recommendItem;
//定义属性
@property (nonatomic,weak) AFHTTPSessionManager *mgr;

@end

@implementation SubscribeViewController


//懒加载
- (NSArray *)recommendItem
{
    if (_recommendItem == nil) {
        _recommendItem = [NSArray array];
    }
    return _recommendItem;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //取消TableView侧滑栏
    self.tableView.showsVerticalScrollIndicator = NO;
    

    //添加刷新控件
    [self setupRefresh];
    //加载数据
    [self loadWeb];
    
    //取消TableView分隔栏样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //在TableView的头部添加一个搜索框
    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 44)];
    search.placeholder = @"搜索标签";
    self.tableView.tableHeaderView = search;
   
}


//添加刷新控件，
- (void)setupRefresh
{
    //下拉时刷新数据
    AnimationRefreshHeader *header = [AnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadWeb)];
    self.tableView.mj_header = header;
}

//加载数据
- (void)loadWeb
{
    
    [Networking GET:@"http://d.api.budejie.com/tag/subscribe/bs0315-iphone-4.2.json?appname=bs0315&asid=4D9488FE-E59B-41A2-9323-AC3934759456&client=iphone&device=ios%20device&from=ios&jbk=0&mac=&market=&openudid=e3ddce7325bff40f8bb8b2851653e15c03c366c2&udid=&ver=4.2" baseURL:nil params:nil success:^(NSURLSessionDataTask *task, id responseObject) {

        //当请求完成后，隐藏指示器
        [SVProgressHUD dismiss];
        
        //将模型保存到数组中
        _recommendItem = [RecommendItem mj_objectArrayWithKeyValuesArray:responseObject[@"rec_tags"]];
        //必须刷新一下页面才会显示数据
        [self.tableView reloadData];
        //结束下拉刷新
        [self.tableView.mj_header endRefreshing];
        NSLog(@"请求订阅数据成功%@",responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        //请求失败
        [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
    }];
    

}

//设置控制器样式
- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _recommendItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [RecommendCell SetupRecommendView];
    }
    
    cell.recommendItem = self.recommendItem[indexPath.row];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 61;
}

//当推荐关注页面即将消失是调用
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //隐藏指示器
    [SVProgressHUD dismiss];
    //取消所有的请求
    [_mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
}


//点击tableView的时候会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

//开始拖动的时候调用这个方法 取消键盘弹出
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

//设置每个组的头部标题的颜色和样式，但是设置完之后必须设置头部View的高度，否则显示不出来，但是这样设置之后滚动TableView的时候Section会停留，若想静止必须设置TableView的样式为Group
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenW, 30)];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentLeft;
//    titleLabel.textColor= CommonBgColor;
    titleLabel.textColor = [UIColor colorWithRed:140/255.0 green:140/255.0 blue:140/255.0 alpha:1];
    
    titleLabel.text= @"推荐标签";
    [myView addSubview:titleLabel];
    return myView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//}
@end
