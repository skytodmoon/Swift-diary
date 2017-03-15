//
//  HomeCourseDetailViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/3.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "HomeCourseDetailViewController.h"
#import "HomeCourseDetailModel.h"
#import "HomeCourseDetailInfoCell.h"
#import "DetailStepListModel.h"
#import "DetailClassListModel.h"
#import "HomeCourseDetailInfoCell.h"
@interface HomeCourseDetailViewController ()<UITableViewDataSource,UITableViewDelegate,HomeCourseDetailInfoDelegate>
{
    HomeCourseDetailModel *_jzCourseDM;
    
    NSMutableArray *_dataSourceArray;/**< 课表数组 */
}


@end

@implementation HomeCourseDetailViewController

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
    [self initTableview];
    [self getClassListData];
    // Do any additional setup after loading the view.
}


-(void)initData{
    _dataSourceArray = [[NSMutableArray alloc] init];
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
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/2-60, 20, 120, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"课程详情";
    [backView addSubview:titleLabel];
    
    //收藏
    UIButton *collectBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(screen_width-40, 20, 40, 40);
    [collectBtn setImage:[UIImage imageNamed:@"course_info_bg_collect"] forState:UIControlStateNormal];
    [collectBtn setImage:[UIImage imageNamed:@"course_info_bg_collected"] forState:UIControlStateSelected];
    [collectBtn addTarget:self action:@selector(OnTapCollectBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:collectBtn];
}

-(void)initTableview{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    /***   添加下拉刷新 */
    QJLRefresh *refresh = [QJLRefresh headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_header = refresh;
}

-(void)OnTapBackBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)OnTapCollectBtn:(UIButton *)sender{
//    [UMSocialSnsService presentSnsIconSheetView:self appKey:UMAPPKEY shareText:@"在美国被禁的网站，请偷偷看" shareImage:[UIImage imageNamed:@"channel_icon_foreign_unpre"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatTimeline,UMShareToWechatSession, nil] delegate:self];
    
}


-(void)loadNewData{
    //设置时间间隔
    NSTimeInterval period = 10.0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        //在这里执行事件
        [self getClassListData];
    });
    dispatch_resume(_timer);
}


-(void)getClassListData{
    

    NSString *urlStr = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=course&act=info&do=getClassList&sid=%@&courseid=%@&version=%@&uid=%@",self.SID,self.courseId,VERSION,UID];
    NSLog(@"urlStr:%@",urlStr);
    __weak typeof(self) weakself = self;
    [[Networking sharedManager] getClassListResult:nil url:urlStr successBlock:^(id responseBody){

        //这个版本的MJExtension里没有setupObjectClassInArray
        _jzCourseDM = [HomeCourseDetailModel mj_objectWithKeyValues:responseBody];
        [_dataSourceArray removeAllObjects];
        
        
        for (int i = 0; i < _jzCourseDM.StepList.count; i++) {
            DetailStepListModel *jzStepListM = [DetailStepListModel mj_objectWithKeyValues:_jzCourseDM.StepList[i]];
            [_dataSourceArray addObject:jzStepListM];
            for (int j = 0; j < jzStepListM.ClassList.count; j++) {
                DetailClassListModel *jzClassM = [DetailClassListModel mj_objectWithKeyValues:jzStepListM.ClassList[j]];
                if (j == jzStepListM.ClassList.count-1) {
                    jzClassM.isLast = @"1";
                }else{
                    jzClassM.isLast = @"0";
                }
                jzClassM.index = [NSString stringWithFormat:@"%d",j+1];
                [_dataSourceArray addObject:jzClassM];
            }
        }
        
        
        [weakself.tableView reloadData];
        [weakself.tableView.mj_header endRefreshing];
    } failureBlock:^(NSString *error){
        
        [weakself.tableView.mj_header endRefreshing];
    }];

}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_jzCourseDM != nil) {
        return 2;
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return _dataSourceArray.count;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }else{
        return 55;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 110;
    }else{
        if ([_dataSourceArray[indexPath.row] isKindOfClass:[DetailStepListModel class]]) {
            return 43;
        }else{
            return 64;
        }
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 55)];
    headerView.backgroundColor = selectColor;
    //图
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/6-12, 5, 25, 25)];
    [imageView1 setImage:[UIImage imageNamed:@"course_catalog_icon"]];
    [headerView addSubview:imageView1];
    //文字
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView1.frame), screen_width/3, 20)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:13];
    label1.text = @"目录";
    [headerView addSubview:label1];
    //图
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTap1:)];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width/2-12, 5, 25, 25)];
    [imageView2 setImage:[UIImage imageNamed:@"course_info_icon"]];
    imageView2.userInteractionEnabled = YES;
    [imageView2 addGestureRecognizer:tap1];
    [headerView addSubview:imageView2];
    //文字
    UITapGestureRecognizer *tap11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTap11)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(screen_width/3, CGRectGetMaxY(imageView1.frame), screen_width/3, 20)];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor whiteColor];
    label2.font = [UIFont systemFontOfSize:13];
    label2.text = @"详情";
    label2.userInteractionEnabled = YES;
    [label2 addGestureRecognizer:tap11];
    [headerView addSubview:label2];
    //图
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTap2)];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(screen_width*5/6-12, 5, 25, 25)];
    [imageView3 setImage:[UIImage imageNamed:@"course_catalog_icon"]];
    imageView3.userInteractionEnabled = YES;
    [imageView3 addGestureRecognizer:tap2];
    [headerView addSubview:imageView3];
    //文字
    UITapGestureRecognizer *tap21 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTap21)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(screen_width*2/3, CGRectGetMaxY(imageView1.frame), screen_width/3, 20)];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = [UIColor whiteColor];
    label3.font = [UIFont systemFontOfSize:13];
    label3.text = @"评价";
    label3.userInteractionEnabled = YES;
    [label3 addGestureRecognizer:tap21];
    [headerView addSubview:label3];
    
    label3.text = [NSString stringWithFormat:@"评价(%@)",_jzCourseDM.TotalAppraise];
    
    
    return headerView;
}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        static NSString *cellIndentifier = @"detailCell0";
//        JZCourseDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
//        if (cell == nil) {
//            cell = [[JZCourseDetailInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
//        }
//        
//        if (_jzCourseDM != nil) {
//            [cell setJzCourseDM:_jzCourseDM];
//        }
//        
//        cell.delegate = self;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }else{
//        if ([_dataSourceArray[indexPath.row] isKindOfClass:[JZStepListModel class]]) {//章
//            static NSString *cellIndentifier = @"detailCell10";
//            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
//            if (cell == nil) {
//                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
//                //下划线
//                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 42.5, screen_width, 0.5)];
//                lineView.backgroundColor = separaterColor;
//                [cell addSubview:lineView];
//            }
//            JZStepListModel *jzStepM = _dataSourceArray[indexPath.row];
//            cell.textLabel.text = [NSString stringWithFormat:@"第%@章:%@",jzStepM.StepIndex,jzStepM.StepName];
//            
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            return cell;
//        }else{//节
//            static NSString *cellIndentifier = @"detailCell11";
//            JZCourseClassCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
//            if (cell == nil) {
//                cell = [[JZCourseClassCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
//                //下划线
//                UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(40, 63.5, screen_width, 0.5)];
//                lineView.tag = 10;
//                lineView.backgroundColor = separaterColor;
//                [cell addSubview:lineView];
//            }
//            
//            JZClassListModel *jzClassM = _dataSourceArray[indexPath.row];
//            if ([jzClassM.isLast isEqualToString:@"1"]) {
//                UIView *lineView = (UIView *)[cell viewWithTag:10];
//                lineView.frame = CGRectMake(0, 63.5, screen_width, 0.5);
//            }
//            [cell setJzClassM:jzClassM];
//            
//            
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            return cell;
//        }
//    }
//    
//    
//    
//    
//    static NSString *cellIndentifier = @"detailCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
//    }
//    
//    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
//}


//#pragma mark - UITableViewDelegate
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if ([_dataSourceArray[indexPath.row] isKindOfClass:[JZClassListModel class]]) {
//        
//        JZClassListModel *jzClassM = _dataSourceArray[indexPath.row];
//        if (jzClassM.VideoUrl == nil) {
//            [SVProgressHUD showErrorWithStatus:@"当前课程视频暂时没有"];
//            
//            return;
//        }
//        
//        
//        NSString *fileUrl = [jzClassM.VideoUrl[0] objectForKey:@"FileURL"];
//        
////        VedioDetailViewController *vedioVC = [[VedioDetailViewController alloc] init];
////        vedioVC.FileUrl = @"http://ws.v.chuanke.com/vedio/9/39/04/93904a21f0e5f881868b5a45597240e7.enc.flv";
////        [self.navigationController pushViewController:vedioVC animated:YES];
//    }
//}

#pragma mark - JZCourseDetailInfoDelegate
-(void)didSelectedSchool{
//    JZSchoolViewController *jzSchoolVC = [[JZSchoolViewController alloc] init];
//    jzSchoolVC.SID = _jzCourseDM.SID;
//    [self.navigationController pushViewController:jzSchoolVC animated:YES];
}


-(void)OnTap1:(UITapGestureRecognizer *)sender{
    [self pushInfoVC];
}
-(void)OnTap11{
    [self pushInfoVC];
}
-(void)pushInfoVC{
//    JZCourseInfoViewController *jzCourseInfoVC = [[JZCourseInfoViewController alloc] init];
//    jzCourseInfoVC.Brief = _jzCourseDM.Brief;
//    [self.navigationController pushViewController:jzCourseInfoVC animated:YES];
}

-(void)OnTap2{
    [self OnTap21];
}
-(void)OnTap21{
//    JZCourseEvaluationViewController *jzEvalVC = [[JZCourseEvaluationViewController alloc] init];
//    jzEvalVC.courseID = self.courseId;
//    jzEvalVC.SID = self.SID;
//    [self.navigationController pushViewController:jzEvalVC animated:YES];
}



@end
