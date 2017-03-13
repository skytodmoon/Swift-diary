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

@interface ProfileViewController ()
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UILabel * titleLb;
@end

@implementation ProfileViewController

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
    
    UIButton * xiaoxi = [UIButton buttonWithType:UIButtonTypeCustom];
    xiaoxi.frame = CGRectMake(0, 0, 25, 25);
    [xiaoxi setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    UIBarButtonItem * leftBar = [[UIBarButtonItem alloc]initWithCustomView:xiaoxi];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    UIButton * shezhi = [UIButton buttonWithType:UIButtonTypeCustom];
    shezhi.frame = CGRectMake(0, 0, 25, 25);
    [shezhi setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    UIBarButtonItem * rightBar = [[UIBarButtonItem alloc]initWithCustomView:shezhi];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    UILabel * titleLb=  [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.font= [UIFont systemFontOfSize:17];
    titleLb.textColor  =[UIColor clearColor];
    titleLb.center = self.navigationController.navigationBar.center;
    titleLb.y = 10;
    [self.navigationController.navigationBar addSubview:titleLb];
    self.titleLb = titleLb;
    NSLog(@"%@",NSStringFromCGRect(self.titleLb.frame));
}

-(void)setupUI{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
    
    self.tableView = tableView;
}

-(void)getProfileData{

    [[Networking sharedManager] getProfileResult:nil url:@"http://open.qyer.com/qyer/user/profile?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=40.01259304990385&lon=116.4602651432521&oauth_token=73a0d5197ceab969461b6ddb980e573a&page=1&track_app_channel=App%2520Store&track_app_version=7.0.1&track_device_info=iPhone8%2C1&track_deviceid=7931B9E3-0421-4170-821D-958F62A93A33&track_os=ios%25209.3.4&track_user_id=7917461&user_id=7917461&v=1" successBlock:^(id responseBody) {
        NSLog(@"个人数据请求成功");
    } failureBlock:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

@end
