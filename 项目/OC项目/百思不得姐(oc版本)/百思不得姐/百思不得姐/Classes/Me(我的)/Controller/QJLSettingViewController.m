//
//  QJLSettingViewController.m
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/7.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "QJLSettingViewController.h"
#import "SDImageCache.h"
#import "SVProgressHUD.h"
#import "UIBarButtonItem+QJLExtension.h"

@interface QJLSettingViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    UITableView *SettingtableView;

}
@end

@implementation QJLSettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self createTableView];
}

-(void)setupNav{
    
    self.view.backgroundColor = QJLlobalBg;

    self.navigationItem.title = @"设置";

}

-(void)createTableView
{
    SettingtableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    SettingtableView.dataSource = self;
    SettingtableView.delegate = self;
    [self.view addSubview:SettingtableView];
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
            cell.textLabel.text = @"关于百思不得姐";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            return cell;
        }else if (indexPath.row==3)
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"i2"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"i2"];
            cell.textLabel.text = @"版本号";
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            UILabel *versionLabel = [UILabel new];
            versionLabel.text = @"2.0";
            versionLabel.textColor = [UIColor colorWithRed:135 / 255.0 green:135 / 255.0 blue:135 / 255.0 alpha:1];
            [versionLabel sizeToFit];
            cell.accessoryView = versionLabel;
            return cell;
            
        }else if(indexPath.row == 2){
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"i2"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"i2"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"推荐给好友";
            cell.textLabel.textColor = [UIColor colorWithRed:128 / 255.0 green:127 / 255.0 blue:125 / 255.0 alpha:1];
            return cell;
        }else{
            
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"i4"];
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"i4"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = [UIColor redColor];
            cell.textLabel.text = @"退出";
            return cell;
            
        }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
//            
//            WeiboViewController *weibo = [[WeiboViewController alloc]init];
//            [self presentViewController:weibo animated:YES completion:nil];
            
            NSLog(@"点击了第一行");
            
        }else{
            [self clearCache];
            NSLog(@"点击了第二行");
        }
    }else{
        if (indexPath.row==0) {
//            GithubViewController *github = [[GithubViewController alloc]init];
//            [self presentViewController:github animated:YES completion:nil];
             NSLog(@"点击了第三行");
            
        }else if (indexPath.row==1){
//            AboutViewController *about = [[AboutViewController alloc]init];
//            
//            [self presentViewController:about animated:YES completion:nil];
            
             NSLog(@"点击了第四行");
        }else if (indexPath.row==2){
            
//            ShareView *shareview = [[ShareView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 160, self.view.frame.size.width, 160)];
//            
//            shareview.title = @"城觅2.0";//一般是你的App名字
//            shareview.message = @"齐金亮的作品";//需要展示的信息简介
//            shareview.shareUrl = @"http://www.jianshu.com/users/ef13bae228f6/latest_articles";//分享的内容地址(点击跳转的地址)
//            shareview.pictureName = @"";//分享的图片名称（必须在左侧项目栏里，且为.png格式，因为shareView进行了配置）
//            
//            
//            [shareview show];
            NSLog(@"点击了第五行");
        }else if (indexPath.row == 4){
//            LoginViewController *login = [[LoginViewController alloc]init];
//            [self presentViewController:login animated:YES completion:nil];
            
             NSLog(@"点击了退出");
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



@end
