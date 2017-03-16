//
//  SettingViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginViewController.h"
#import "PrefixHeader.pch"
#import "AlertView.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate,AlertViewDelegate>{
    
    UITableView *_tableView;
    UIView *view;
}


@property(nonatomic,strong)UIView *bg;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)AlertView *btnView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self createTableView];
    // Do any additional setup after loading the view.
}

-(void)initNav{
    //创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screen_width, 66)];
    //把导航栏集合添加到导航栏中，设置动画关闭，设置颜色
    [navBar pushNavigationItem:[self navItem] animated:NO];
    //设置NavigationBar背景颜色
    [[UINavigationBar appearance] setBarTintColor:RGBA(26,198,180,1)];
    [self.view addSubview:navBar];
}

-(UINavigationItem *)navItem{
    // 创建一个导航项
    UINavigationItem *navigationItem = [[UINavigationItem alloc]
                                        initWithTitle:@"设置"];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    return navigationItem;
}

-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else{
        return 5;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id1"];
            cell.textLabel.text = @"我的微博";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            return cell;
        }else
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"i1"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"i1"];
            cell.textLabel.text = @"清除缓存";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            return cell;
        }
    }else
    {
        if (indexPath.row==0) {
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id2"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id2"];
            cell.textLabel.text = @"我的github";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            return cell;
            
        }else if (indexPath.row==1)
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"i3"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"i3"];
            cell.textLabel.text = @"关于城觅";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            return cell;
        }else if (indexPath.row==3)
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"i2"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"i2"];
            cell.textLabel.text = @"版本号";
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            return cell;
            
        }else if(indexPath.row == 2){
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"i2"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"i2"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"分享好友";
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            
            
            return cell;
        }else{
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"i4"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"i4"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            cell.textLabel.text = @"退出";
            return cell;
            
        }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            
       
            
        }else{
            [self clearCache];
        }
    }else{
        if (indexPath.row==0) {
         
            
        }else if (indexPath.row==1){
            
        }else if (indexPath.row==2){
            
            [self shareView];
            
        }else if (indexPath.row == 4){
            LoginViewController *login = [[LoginViewController alloc]init];
            [self.navigationController pushViewController:login animated:YES];
        }
    }
}
- (void)clearCache
{
    SDImageCache * imageChache = [SDImageCache sharedImageCache];
    NSUInteger cacheSize = [imageChache getSize]; // 单位为：byte
    NSUInteger cacheNum = [imageChache getDiskCount]; // 缓存的图片数量
    NSString * msg = [NSString stringWithFormat:@"缓存文件总共%lu个，大小%.2fM，是否清除？", cacheNum, cacheSize / 1024 / 1024.0];
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"清除缓存" message:msg preferredStyle:UIAlertControllerStyleAlert];
    // 创建AlertAction
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"清除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        // 清除缓存
        
        [imageChache clearMemory];
        [imageChache clearDisk];
        [SVProgressHUD showSuccessWithStatus:@"清除成功"];
    }];
    
    // 将UIAlertAction添加到UIAlertController中
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    // present显示
    [self presentViewController:alertController animated:YES completion:nil];
    
}


-(void)shareView{
    //底部大的透明 view
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.8;
    self.bg = bgView;
    self.bg.hidden = NO;
    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
    
    //创建手势对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce:)];
    //点击的次数
    tap.numberOfTouchesRequired = 1;
    [self.bg addGestureRecognizer:tap];
    
    //透明 view 上在贴个 view
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    topView.alpha = 1.0;
    topView.frame = CGRectMake(30, screen_width/2, screen_width - 60, screen_width/2);
    self.topView = topView;
    self.topView.hidden = NO;
    [[UIApplication sharedApplication].keyWindow addSubview:topView];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:topView];
    
    //上边 view 的标题
    UILabel *topL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _topView.width, 45)];
    topL.backgroundColor = RGBA(237, 197, 23,1);
    topL.text = @"分享好友";
    topL.textAlignment = NSTextAlignmentCenter;
    topL.textColor = [UIColor whiteColor];
    [_topView addSubview:topL];
    
    self.btnView = [[AlertView alloc] initWithFrame:CGRectMake(25, _topView.height/6, _topView.width-25, _topView.height/2)];
    _btnView.delegate = self;
    [self.topView addSubview:self.btnView];
    for (int i = 0; i < 4; i++) {
        UILabel *lab = [[UILabel alloc] init];
        lab.y = _btnView.y+_btnView.height;
        lab.width = (_topView.width-30)/4;
        lab.height = 25;
        lab.x = i * lab.width + 15;
        lab.textAlignment = NSTextAlignmentCenter;
        [_topView addSubview:lab];
        switch (i) {
            case 0:
                lab.text = @"微信";
                break;
            case 1:
                lab.text = @"朋友圈";
                break;
            case 2:
                lab.text = @"空间";
                break;
            case 3:
                lab.text = @"QQ";
                break;
                
            default:
                break;
        }
    }

    
}

-(void)tapOnce:(UITapGestureRecognizer *)tapGes{
    self.bg.hidden = YES;
    self.topView.hidden = YES;
}

#pragma mark AlertViewDelegate Method
-(void)alertView:(AlertView *)alertView didSelectedBtn:(AlertViewBtnType)btnType{
    switch (btnType) {
        case AlertViewBtnTypeWeChat:
            NSLog(@"微信");
            break;
        case AlertViewBtnTypeFriend:
            NSLog(@"朋友圈");
            break;
        case AlertViewBtnTypeZone:
            NSLog(@"空间");
            break;
        case AlertViewBtnTypeQQ:
            NSLog(@"QQ");
            break;
            
        default:
            break;
    }
}




@end
