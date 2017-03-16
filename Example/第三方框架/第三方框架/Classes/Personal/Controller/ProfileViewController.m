//
//  ProfileViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/7.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "ProfileViewController.h"
#import "PrefixHeader.pch"
#import "UINavigationBar+NavAlpha.h"
#import "QYMineBlurView.h"
#import "UserInfo.h"
#import "MineModel.h"
#import "SettingViewController.h"

@interface ProfileViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)QYMineBlurView * qyBlurView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UILabel * titleLb;
@property (nonatomic,strong)UIView *header;
@property (nonatomic,strong)UIImageView * iconImage;
@property (nonatomic,strong)UILabel * nameLabel;
@property (nonatomic,strong)UILabel * fensiLb;
@property (nonatomic,strong)UILabel * guanzhuLb;
@property (nonatomic,strong)UserInfo * userData;
@property (nonatomic,strong)NSArray * topArray;
@property (nonatomic,strong)NSArray * dataArray;
@end

@implementation ProfileViewController


- (NSArray *)dataArray{
    
    if (_dataArray == nil) {
        _dataArray = @[
                       @[@"我的订单",@"我收藏的折扣",@"我的优惠券"],
                       @[@"我收藏的目的地",@"我的足迹",@"等我点评的目的地"],
                       @[@"我发布的帖子",@"我的问答",@"我的结伴"]];
    }
    return _dataArray;
}

- (NSArray *)topArray{
    
    if (_topArray == nil) {
        _topArray = @[@"收藏的帖子",@"我的锦囊",@"我的行程"];
    }
    return _topArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self setupUI];
    [self getProfileData];
    // Do any additional setup after loading the view.
}

-(void)initNav{
    
    /** 导航栏的背景色是黑色, 字体为白色 */
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    /** 用于去除导航栏的底线，也就是周围的边线 */
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    UIColor *color = RGBA(6, 173, 114,1);
    [self.navigationController.navigationBar cnSetBackgroundColor:[color colorWithAlphaComponent:0]];
    /***添加左右导航栏 */
    UIButton * message = [UIButton buttonWithType:UIButtonTypeCustom];
    message.frame = CGRectMake(0, 0, 25, 25);
    [message setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    [message addTarget:self action:@selector(leftBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftBar = [[UIBarButtonItem alloc]initWithCustomView:message];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    UIButton * setting = [UIButton buttonWithType:UIButtonTypeCustom];
    setting.frame = CGRectMake(0, 0, 25, 25);
    [setting addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    [setting setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    UIBarButtonItem * rightBar = [[UIBarButtonItem alloc]initWithCustomView:setting];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    UILabel * titleLb=  [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.font= [UIFont systemFontOfSize:17];
    titleLb.textColor  =[UIColor clearColor];
    titleLb.center = self.navigationController.navigationBar.center;
    titleLb.y = 10;
    [self.navigationController.navigationBar addSubview:titleLb];
    self.titleLb = titleLb;

}

-(void)rightBtn{
    SettingViewController *setting = [[SettingViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setting animated:YES];
    NSLog(@"点击了设置");
}

-(void)leftBtn{

    NSLog(@"点击了消息");
}

-(void)setupUI{
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height-49) style:UITableViewStylePlain];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource  =self;
    self.tableView = tableView;
    
    
    self.header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, topViewHeight)];
    _qyBlurView = [[QYMineBlurView alloc]initWithFrame:CGRectMake(0, 0, screen_width, topViewHeight)];
    _qyBlurView.scrollView = self.tableView;
    _qyBlurView.isGlassEffectOn = YES;
    _qyBlurView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.header addSubview:_qyBlurView];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = CGRectMake(0, topViewHeight-174/2, screen_width, 174/2);
    [self.header addSubview:effectview];
    
    for (int i =0; i<3; i++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(screen_width/7*(i+1)+35*i+30*i, 20, 35, 35);
        [button setBackgroundImage:[UIImage imageNamed:self.topArray[i]] forState:UIControlStateNormal];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame)+7, 100, 15)];
        label.textColor = [UIColor whiteColor];
        label.text = self.topArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        label.centerX = button.centerX;
        
        [effectview addSubview:button];
        [effectview addSubview:label];
    }
    
    
    UIImageView * iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 112/2, 112/2)];
    iconImage.layer.cornerRadius = 112/4;
    iconImage.layer.masksToBounds = YES;
    [self.header addSubview:iconImage];
    self.iconImage = iconImage;
    
    UILabel * namelbel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImage.frame)+15, 105, 150, 20)];
    namelbel.textColor = [UIColor whiteColor];
    namelbel.font = [UIFont systemFontOfSize:15];
    namelbel.textAlignment = NSTextAlignmentLeft;
    [self.header addSubview:namelbel];
    self.nameLabel = namelbel;
    
    UILabel * fensi = [[UILabel alloc]initWithFrame:CGRectMake(self.nameLabel.x, CGRectGetMaxY(self.nameLabel.frame)+10, 60, 16)];
    fensi.textColor = [UIColor whiteColor];
    fensi.textAlignment = NSTextAlignmentLeft;
    fensi.font = [UIFont systemFontOfSize:13];
    [self.header addSubview:fensi];
    self.fensiLb = fensi;
    
    UILabel * guanzhu = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.fensiLb.frame) , CGRectGetMaxY(self.nameLabel.frame)+10, 60, 16)];
    guanzhu.textColor = [UIColor whiteColor];
    guanzhu.textAlignment = NSTextAlignmentLeft;
    guanzhu.font = [UIFont systemFontOfSize:13];
    [self.header addSubview:guanzhu];
    self.guanzhuLb = guanzhu;
    
    self.tableView.tableHeaderView = self.header;
    [self.view addSubview:self.tableView];

}

-(void)getProfileData{
    [SVProgressHUD showWithStatus:@"正在加载中"];
    [[Networking sharedManager] getProfileResult:nil url:@"http://open.qyer.com/qyer/user/profile?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=40.01259304990385&lon=116.4602651432521&oauth_token=73a0d5197ceab969461b6ddb980e573a&page=1&track_app_channel=App%2520Store&track_app_version=7.0.1&track_device_info=iPhone8%2C1&track_deviceid=7931B9E3-0421-4170-821D-958F62A93A33&track_os=ios%25209.3.4&track_user_id=7917461&user_id=7917461&v=1" successBlock:^(id responseBody) {
        MineModel * mineModel = [MineModel mj_objectWithKeyValues:responseBody];
        UserInfo * userData = [UserInfo mj_objectWithKeyValues:mineModel.data];
        NSData * data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:userData.cover]];
        UIImage *image = [[UIImage alloc]initWithData:data];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 2), ^{
            // 处理耗时的操作
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.iconImage sd_setImageWithURL:[NSURL URLWithString:userData.avatar] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
                self.nameLabel.text = userData.username;
                _qyBlurView.originalImage = image;
                self.fensiLb.text = [NSString stringWithFormat:@"粉丝 %@",userData.fans];
                self.guanzhuLb.text = [NSString stringWithFormat:@"关注 %@",userData.follow];
                self.titleLb.text = userData.username;
                [SVProgressHUD dismiss];
            });
        });
    } failureBlock:^(NSString *error) {
        [SVProgressHUD showErrorWithStatus:@"网络繁忙,请重新加载"];
        NSLog(@"%@",error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 10)];
    view.backgroundColor = RGB(236, 236, 236);
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * mine = @"mineCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:mine];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mine];
        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 25, 25)];
        imageV.image =[UIImage imageNamed:self.dataArray[indexPath.section][indexPath.row]];
        [cell.contentView addSubview:imageV];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame)+15, 12, 150, 18)];
        label.textColor = RGB(76, 77, 79);
        label.text = self.dataArray[indexPath.section][indexPath.row];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        
    }
    
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 25, 25)];
    imageV.image =[UIImage imageNamed:self.dataArray[indexPath.section][indexPath.row]];
    [cell.contentView addSubview:imageV];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame)+15, 12, 150, 18)];
    label.textColor = RGB(76, 77, 79);
    label.text = self.dataArray[indexPath.section][indexPath.row];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:14];
    [cell.contentView addSubview:label];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat Offset_y = scrollView.contentOffset.y;
    // 下拉 纵向偏移量变小 变成负的
    if ( Offset_y < 0) {
        // 拉伸后图片的高度
        CGFloat totalOffset = topViewHeight - Offset_y;
        // 图片放大比例
        CGFloat scale = totalOffset / topViewHeight;
        CGFloat width = screen_width;
        // 拉伸后图片位置
        _qyBlurView.frame = CGRectMake(-(width * scale - width) / 2, Offset_y, width * scale, totalOffset);
        
    }
    
    UIColor *color = RGB(6, 173, 114);
    UIColor * whiColor = RGB(255, 255, 255);
    if (Offset_y > 0) {
        CGFloat alpha = MIN(1, ( 64 + Offset_y)/64-1);
        self.titleLb.textColor = [whiColor colorWithAlphaComponent:alpha];
        [self.navigationController.navigationBar cnSetBackgroundColor:[color colorWithAlphaComponent:alpha]];
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    } else {
        self.titleLb.textColor = [whiColor colorWithAlphaComponent:0];
        [self.navigationController.navigationBar cnSetBackgroundColor:[color colorWithAlphaComponent:0]];
        
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
