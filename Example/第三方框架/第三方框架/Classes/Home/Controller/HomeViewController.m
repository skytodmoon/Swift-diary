//
//  HomeViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "HomeTableViewCell.h"
#import "HomeCourseListModel.h"
#import "HomeFocusListModel.h"
#import "HomeimageScrollCell.h"
#import "HomelbumCell.h"
#import "HomeCourseCell.h"
#import "HomeCourseDetailViewController.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,ImageScrollViewDelegate,HomelbumDelegate>{

    NSMutableArray *_focusListArray;/**< 第一个轮播数据 */
    NSMutableArray *_focusImgurlArray;/**< 第一个轮播图片URL数据 */
    NSMutableArray *_courseListArray;/**< 列表数据 */
    NSMutableArray *_albumListArray;/**< 第二个轮播数据 */
    NSMutableArray *_albumImgurlArray;/**< 第二个轮播图片URL数据 */
    
    NSInteger _type;/**< segment */
    
    NSMutableArray *_classCategoryArray;/**< 课程分类数组 */
    NSMutableArray *_iCategoryListArray;
}
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self setNav];
    
    [self initTableView];
    [self getRecommendData];
    // Do any additional setup after loading the view.
}

-(void)initData{
    _focusListArray = [[NSMutableArray alloc] init];
    _courseListArray = [[NSMutableArray alloc] init];
    _albumListArray = [[NSMutableArray alloc] init];
    
    _focusImgurlArray = [[NSMutableArray alloc] init];
    _albumImgurlArray = [[NSMutableArray alloc] init];
    
    _type = 0;
    //读取plist文件
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"classCategory" ofType:@"plist"];
    _classCategoryArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
    //课程类型
    NSString *iCategoryListPath = [[NSBundle mainBundle] pathForResource:@"iCategoryList" ofType:@"plist"];
    _iCategoryListArray = [[NSMutableArray alloc] initWithContentsOfFile:iCategoryListPath];
    
    
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

//搜索
-(void)OnSearchBtn:(UIButton *)sender{
    self.hidesBottomBarWhenPushed=YES;
    SearchViewController *search = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
}

//响应事件
-(void)OnTapSegmentCtr:(UISegmentedControl *)seg{
    NSInteger index = seg.selectedSegmentIndex;
    if (index == 0) {
        _type = 0;
    }else{
        _type = 1;
    }
    [self.tableView reloadData];
}


-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 98, screen_width, screen_height-98-49) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    /***   添加下拉刷新 */
    QJLRefresh *refresh = [QJLRefresh headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_header = refresh;

}


-(void)loadNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getRecommendData];
    });
    

}


//请求推荐课程数据
-(void)getRecommendData{
     __weak typeof(self) weakself = self;
      NSString *urlStr = @"http://pop.client.chuanke.com/?mod=recommend&act=mobile&client=2&limit=20";
    [[Networking sharedManager] getRecommendCourseResult:nil url:urlStr successBlock:^(id responseBody) {
        NSLog(@"请求推荐课程数据成功");
        NSMutableArray *focusArray = [responseBody objectForKey:@"FocusList"];
        NSMutableArray *courseArray = [responseBody objectForKey:@"CourseList"];
        NSMutableArray *albumArray = [responseBody objectForKey:@"AlbumList"];
        
        
        [_focusListArray removeAllObjects];
        [_focusImgurlArray removeAllObjects];
        [_courseListArray removeAllObjects];
        [_albumListArray removeAllObjects];
        [_albumImgurlArray removeAllObjects];
        
        
        for (int i = 0; i < focusArray.count; ++i) {
            HomeCourseListModel *jzFocusM = [HomeCourseListModel mj_objectWithKeyValues:focusArray[i]];
            [_focusListArray addObject:jzFocusM];
            [_focusImgurlArray addObject:jzFocusM.PhotoURL];
        }
        for (int i = 0; i < courseArray.count; ++i) {
            HomeCourseListModel *jzCourseM = [HomeCourseListModel mj_objectWithKeyValues:courseArray[i]];
            [_courseListArray addObject:jzCourseM];
        }
        for (int i = 0; i < albumArray.count; ++i) {
            HomeCourseListModel *jzAlbumM = [HomeCourseListModel mj_objectWithKeyValues:albumArray[i]];
            [_albumListArray addObject:jzAlbumM];
            [_albumImgurlArray addObject:jzAlbumM.PhotoURL];
        }
//        weakself.tableView.hidden = NO;
        [weakself.tableView reloadData];
        [weakself.tableView.mj_header endRefreshing];
    } failureBlock:^(NSString *error) {
        [SVProgressHUD showErrorWithStatus:error];
        
        NSLog(@"请求推荐课程数据失败：%@",error);
        [weakself.tableView.mj_header endRefreshing];
    }];
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_type == 0) {
        if (_courseListArray.count>0) {
            return _courseListArray.count+2;
        }else{
            return 0;
        }
    }else{
        return _classCategoryArray.count;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_type == 0) {
        if (indexPath.row == 0) {
            return 155;
        }else if (indexPath.row == 1){
            return 90;
        }else{
            return 72;
        }
    }else{
        return 60;
    }
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_type == 0) {
        if (indexPath.row == 0) {
            static NSString *cellIndentifier = @"courseCell0";
            HomeimageScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[HomeimageScrollCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier frame:CGRectMake(0, 0, screen_width, 155)];
            }
            cell.imageScrollView.delegate = self;
            [cell setImageArr:_focusImgurlArray];
            return cell;
        }else if (indexPath.row == 1){
            static NSString *cellIndentifier = @"courseCell1";
            HomelbumCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {                
                cell = [[HomelbumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier frame:CGRectMake(0, 0, screen_width, 90)];
                //下划线
                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 89.5, screen_width, 0.5)];
                lineView.backgroundColor = separaterColor;
                [cell addSubview:lineView];
            }
            
            cell.delegate = self;
            [cell setImgurlArray:_albumImgurlArray];
            
            
            return cell;
        }else if (indexPath.row > 1){
            static NSString *cellIndentifier = @"courseCell2";
            HomeCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
            if (cell == nil) {
                cell = [[HomeCourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                //下划线
                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 71.5, screen_width, 0.5)];
                lineView.backgroundColor = separaterColor;
                [cell addSubview:lineView];
            }
            
            HomeCourseListModel *jzCourseM = _courseListArray[indexPath.row-2];
            [cell setJzCourseM:jzCourseM];
            
            return cell;
        }
        static NSString *cellIndentifier = @"courseCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        }
        
        return cell;
    }else{
        static NSString *cellIndentifier = @"courseClassCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
            //下划线
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 59.5, screen_width, 0.5)];
            lineView.backgroundColor = separaterColor;
            [cell addSubview:lineView];
            //图
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
            imageView.tag = 10;
            [cell addSubview:imageView];
            //标题
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 15, 100, 30)];
            titleLabel.tag = 11;
            [cell addSubview:titleLabel];
        }
        NSDictionary *dataDic = _classCategoryArray[indexPath.row];
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:10];
        NSString *imageStr = [dataDic objectForKey:@"image"];
        [imageView setImage:[UIImage imageNamed:imageStr]];
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:11];
        titleLabel.text = [dataDic objectForKey:@"title"];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (_type == 0) {
//        HomeCourseListModel *jzCourseM = _courseListArray[indexPath.row-2];
//        HomeCourseDetailViewController *jzCourseM = [[HomeCourseDetailViewController alloc] init];
//        jzCourseM.SID = jzCourseM.SID;
//        jzCourseM.courseId = jzCourseM.CourseID;
//        [self.navigationController pushViewController:jzCourseM animated:YES];
//    }else{
//        JZCateViewController *jzCateVC = [[JZCateViewController alloc] init];
//        if (indexPath.row == 0) {
//            jzCateVC.cateType = @"zhibo";
//        }else{
//            NSDictionary *dic = _iCategoryListArray[indexPath.row-1];
//            jzCateVC.cateType = @"feizhibo";
//            jzCateVC.cateNameArray = [dic objectForKey:@"categoryName"];
//            jzCateVC.cateIDArray = [dic objectForKey:@"categoryID"];
//        }
//    
//        
//        [self.navigationController pushViewController:jzCateVC animated:YES];
//    }
    
}


#pragma mark - ImageScrollViewDelegate
-(void)didSelectImageAtIndex:(NSInteger)index{
    HomeFocusListModel *jzFocusM = _focusListArray[index];
    
    HomeCourseDetailViewController *jzCourseDVC = [[HomeCourseDetailViewController alloc] init];
    jzCourseDVC.SID = jzFocusM.SID;
    jzCourseDVC.courseId = jzFocusM.CourseID;
    [self.navigationController pushViewController:jzCourseDVC animated:YES];
}

#pragma mark - JZAlbumDelegate
-(void)didSelectedAlbumAtIndex:(NSInteger)index{
    NSLog(@"album index:%ld",index);
    if (index == 0) {
        NSURL *url = [NSURL URLWithString:@"openchuankekkiphone:"];
        BOOL isInstalled = [[UIApplication sharedApplication] openURL:url];
        if (isInstalled) {
            
        }else{
            NSURL *url1 = [NSURL URLWithString:@"https://appsto.re/cn/78XAL.i"];
            [[UIApplication sharedApplication] openURL:url1];
            NSLog(@"没安装");
        }
    }else{
        SearchViewController *search = [[SearchViewController alloc] init];
        [self.navigationController pushViewController:search animated:YES];
    }
    
}


@end
