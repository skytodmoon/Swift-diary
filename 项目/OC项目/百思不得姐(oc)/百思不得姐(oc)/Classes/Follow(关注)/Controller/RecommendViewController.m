//
//  RecommendViewController.m
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//


#import "RecommendViewController.h"
#import "LoginRegisterViewController.h"
#import "CategoryItem.h"
#import "CaregroyCell.h"
#import "UserCell.h"
#import "UserItem.h"


#define SelectedCategory self.caregroyItems[self.caregroyView.indexPathForSelectedRow.row]

#define UserURL @"http://api.budejie.com/api/api_open.php?a=list&appname=bs0315&asid=4D9488FE-E59B-41A2-9323-AC3934759456&c=subscribe&category_id=35&client=iphone&device=ios%20device&from=ios&jbk=0&mac=&market=&openudid=f1e1e75d11ec5e8a96503b30220f196e37759455&page=1&pagesize=50&udid=&ver=4.2"

#define CategoryURL @"http://api.budejie.com/api/api_open.php?a=category&appname=bs0315&asid=4D9488FE-E59B-41A2-9323-AC3934759456&c=subscribe&client=iphone&device=ios%20device&from=ios&jbk=0&mac=&market=&openudid=f1e1e75d11ec5e8a96503b30220f196e37759455&udid=&ver=4.2"

static NSString *const caregroyID = @"caregroyCell";
static NSString *const userID = @"userID";

@interface RecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
//左侧分栏
@property (weak, nonatomic) IBOutlet UITableView *caregroyView;
//左侧数据
@property (nonatomic,strong) NSArray *caregroyItems;
//右侧分栏
@property (weak, nonatomic) IBOutlet UITableView *userView;
//请求参数
@property (nonatomic,strong) NSMutableDictionary *parameters;
//AFN请求管理者
@property (nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation RecommendViewController

//懒加载请求数据方式
- (AFHTTPSessionManager *)manager
{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //控件的初始化
    [self setupTableView];
    
    //添加刷新控件
    [self setupRefresh];
    
    //加载左侧的类别数据
    [self loadCategories];
    
    
}

//加载左侧的类别数据
- (void)loadCategories
{
    
//    //自定义SVProgressHUD显示时背景颜色
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor blueColor]];
    
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    
    [Networking GET:@"http://api.budejie.com/api/api_open.php" baseURL:nil params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        //隐藏指示器
        [SVProgressHUD dismiss];
        
        //服务器返回的JSON解析
        _caregroyItems = [CategoryItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新表格
        [_caregroyView reloadData];
        
        //默认选中首行,只有先刷新表格之后才能设置默认行
        [_caregroyView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        //让用户表格进入下拉刷新状态，当选中默认的类别行时，右侧用户数据也应该及时显示出来，所以当已进入这个页面时左侧已有默认行，那么右侧的数据显示时要给用户一种加载中的效果
        [self.userView.mj_header beginRefreshing];
        NSLog(@"请求数据成功%@",responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        //显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
    }];

}

//控件初始化
- (void)setupTableView
{
    //标题名字
    self.navigationItem.title = @"推荐关注";

    //导航栏右侧按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_search_icon~iphone" hightImage:@"nav_search_icon_click~iphone" target:self action:@selector(searchBtn)];
#pragma mark - tableView样式
    //取消左侧分隔栏样式
    _caregroyView.separatorStyle = UITableViewCellSeparatorStyleNone;
  //取消右侧分隔栏样式
      _userView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //用户表格的行高
    _userView.rowHeight = 60;
    
    //注册
    //左侧注册
    [_caregroyView registerNib:[UINib nibWithNibName:NSStringFromClass([CaregroyCell class]) bundle:nil] forCellReuseIdentifier:caregroyID];
    //右侧注册
    [_userView registerNib:[UINib nibWithNibName:NSStringFromClass([UserCell class]) bundle:nil] forCellReuseIdentifier:userID];
    
    _userView.backgroundColor = CommonBgColor;
    _caregroyView.backgroundColor = CommonBgColor;
    
    //取消系统默认的高度，自己设置距离导航栏的高度
    self.automaticallyAdjustsScrollViewInsets = NO;
    _caregroyView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    _userView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
  

}

//添加刷新控件，
- (void)setupRefresh
{
    //下拉时刷新数据
    AnimationRefreshHeader *header = [AnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUser)];
    _userView.mj_header = header;
    //上拉时刷新数据
    self.userView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
    //进入页面的时候下拉刷新样式应该隐藏
    self.userView.mj_footer.hidden = YES;
}

//当用户下拉时会加载新的数据即刷新控件
- (void)loadNewUser
{
    //设置这段代码的意义在于，当我们下拉或者上拉加载到一半时突然进行其他的操作可以撤销正在进行的操作
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    //左侧选中按钮对应的模型
    CategoryItem *categroyItem = SelectedCategory;
    
    //设置当前页面为第一页
    categroyItem.currentPage = 1;
    
    //加载数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    //此参数记录的右侧按钮的数据属于左侧哪个按钮，点击左侧按钮之后右侧内容会发生变化
    parameters[@"category_id"] = @(categroyItem.ID);
    
    //页数的变化
    parameters[@"page"] = @(categroyItem.currentPage);
    self.parameters = parameters;
    
    [Networking GET:@"http://api.budejie.com/api/api_open.php" baseURL:nil params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        //保存一个数组
        NSArray *users = [UserItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //当加载新的数据时应该先删除之前的旧数据
        [categroyItem.users removeAllObjects];
        
        //把新的数据添加到用户总数中
        [categroyItem.users addObjectsFromArray:users];
        
        //记录右侧出现的数量一共有多少用来和总数进行判断
        categroyItem.total = [responseObject[@"total"] integerValue];
        
        //判断是否是最后一次请求
        if (self.parameters != parameters) return;
        
        //刷新
        [self.userView reloadData];
        
        //结束下拉刷新
        [self.userView.mj_header endRefreshing];
        
        //让底部控件结束刷新
        [self checkFooterState];
        NSLog(@"请求推荐关注数据成功%@",responseObject);
        
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        //判断是否是最后一次请求
        if (self.parameters != parameters) return;
        
        [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
        // 结束刷新
        [self.userView.mj_footer endRefreshing];
    }];


}

//加载更多
- (void)loadMoreUsers
{
   //左侧选中按钮对应的模型
    CategoryItem *categroyItem = SelectedCategory;
    //加载数据
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] = @(categroyItem.ID);
    //页数加1 新的数据会出现
    parameters[@"page"] = @(++categroyItem.currentPage);
    self.parameters = parameters;
    
    [Networking GET:@"http://api.budejie.com/api/api_open.php" baseURL:nil params:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray *users = [UserItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 添加到当前类别对应的用户数组中
        [categroyItem.users addObjectsFromArray:users];
        
        
        // 不是最后一次请求
        if (self.parameters != parameters) return;
        
        // 刷新右边的表格
        [self.userView reloadData];
        
        // 让底部控件结束刷新
        [self checkFooterState];
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        if (self.parameters != parameters) return;
        
        // 提醒
        [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
        
        // 让底部控件结束刷新
        [self.userView.mj_footer endRefreshing];
    }];
    
}

//根据footer的状态作出相应的变化
- (void)checkFooterState
{
    CategoryItem *categoryItem = SelectedCategory;
    
    // 每次刷新右边数据时, 都控制footer显示或者隐藏
    self.userView.mj_footer.hidden = (categoryItem.users.count == 0);
    
    // 让底部控件结束刷新
    if (categoryItem.users.count == categoryItem.total) {
        
        //全部数据已经加载完毕
//        [self.userView.mj_header endRefreshing];
        [self.userView.mj_footer endRefreshingWithNoMoreData];
        
    }else{
        
        //还没有加载完毕
        [self.userView.mj_footer endRefreshing];
    }

}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _caregroyView) return self.caregroyItems.count;
    
    [self checkFooterState];
    
    return [SelectedCategory users].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _caregroyView) {
        CaregroyCell *cell = [tableView dequeueReusableCellWithIdentifier:caregroyID];
        cell.categroy = self.caregroyItems[indexPath.row];
        return cell;
    }else
    {
        UserCell *cell = [tableView dequeueReusableCellWithIdentifier:userID];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userItem = [SelectedCategory users][indexPath.row];
        return cell;
    }
}

//选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 结束刷新
    [self.userView.mj_header endRefreshing];
    [self.userView.mj_footer endRefreshing];
    
    CategoryItem *categoryItem = self.caregroyItems[indexPath.row];
    
    if (categoryItem.users.count) {
        // 显示曾经的数据
        [_userView reloadData];
    } else {
         // 赶紧刷新表格,目的是: 马上显示当前category的用户数据, 不让用户看见上一个category的残留数据
        [_userView reloadData];
        
        // 进入下拉刷新状态
        [self.userView.mj_header beginRefreshing];
        }
}

//导航栏右上角搜索按钮
- (void)searchBtn
{
    LoginRegisterViewController *login = [[LoginRegisterViewController alloc]init];
    [self.navigationController presentViewController:login animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _userView) {
        return 60;
    }
    return 44;
}

#pragma mark - 控制器的销毁
- (void)dealloc
{
    // 停止所有操作
    [self.manager.operationQueue cancelAllOperations];
}
@end