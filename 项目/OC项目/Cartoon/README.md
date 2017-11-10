##前言
*一直很久都没有发布新的作品，在公司每天晚上都在练习swift，感觉还是有点别扭，用习惯了oc语言换成swift有点陌生，在此，本人会加紧努力学习swift，来一个高仿的项目(swift版本)，或者分享好友项目都可以，经过了一个月的公司杂事，小任务也比较多，上期[维尼的小熊](http://www.jianshu.com/users/5fe7513c7a57)老师开发了一款游戏，有兴趣的同学可以去下载看，真心不容易，这不我也花了很久的时间高仿漫画，上次的高仿京东做的不是很好，后期会更新*
###项目介绍
我们来看看项目吧，这是项目的结构

![Snip20160629_4.png](http://upload-images.jianshu.io/upload_images/1754828-a5e43f4d5c353f59.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 总共所有的东西都放在Classes文件夹，在这里本人喜欢对项目进行划分的很仔细

![Snip20160629_5.png](http://upload-images.jianshu.io/upload_images/1754828-808658deb67003c2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 上图就是所有的结构和划分，重点内容是在`Public(公共页面比较多)`

![Snip20160629_6.png](http://upload-images.jianshu.io/upload_images/1754828-ab51fed7dd76d7ac.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 这就是公共页面的东西，项目用了一些xib和故事版
- 看完结构我们看效果图吧

###效果动态图

- 首先是启动页面来到首页

![1.gif](http://upload-images.jianshu.io/upload_images/1754828-6972c4749d72ddf6.gif?imageMogr2/auto-orient/strip)

`AppDelegate`

```
#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "UserInfoManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

_window.rootViewController = [MainTabBarController new];

[_window makeKeyAndVisible];

[UserInfoManager autoLogin];
// Override point for customization after application launch.
return YES;
}
```

- 这是项目启动的开头，代码慢慢说，先把所有的动态效果图

![2.gif](http://upload-images.jianshu.io/upload_images/1754828-b63946e4aebee61f.gif?imageMogr2/auto-orient/strip)


![3.gif](http://upload-images.jianshu.io/upload_images/1754828-ffe69ec4f686af2f.gif?imageMogr2/auto-orient/strip)



![4.gif](http://upload-images.jianshu.io/upload_images/1754828-5d4adecbecc71160.gif?imageMogr2/auto-orient/strip)


![5.gif](http://upload-images.jianshu.io/upload_images/1754828-894b7558031d2762.gif?imageMogr2/auto-orient/strip)


##代码介绍

因为我把`MainTabBarController`这是为主控制器，Main被我去掉了找到之后所有的页面就清楚了

`_window.rootViewController = [MainTabBarController new];`

```
- (void)viewDidLoad {
[super viewDidLoad];

HomeViewController * home = [[HomeViewController alloc] init];

FindingsViewController * find = [[FindingsViewController alloc] init];

UIViewController *person = [UIStoryboard storyboardWithName:@"PersonalCenter" bundle:nil].instantiateInitialViewController;


[self addChildViewControllers:@[home,find]];

[super addChildViewController:person];
}
```

- 分别对应这个三个控制器，`HomeViewController, FindingsViewController`,还有一个比较陌生，不想，其实那是用了故事版 `storyboardWithName:@"PersonalCenter"`

- 这么多的东西找一个故事版岂不是很慢，怎么快速找到类，并且还在哪个文件夹里，这里我说个题外话，作者这里截图介绍


![Snip20160629_7.png](http://upload-images.jianshu.io/upload_images/1754828-4e4454825cf78cfe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20160629_9.png](http://upload-images.jianshu.io/upload_images/1754828-38a86a0981078983.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20160629_10.png](http://upload-images.jianshu.io/upload_images/1754828-2ea505771f126a38.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20160629_11.png](http://upload-images.jianshu.io/upload_images/1754828-4fe37940ded5ffae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 这样我就快速找到了我们想要的东西
- 所有的控制器都已经找到了，我们就可以分别对应页面看看写了什么

首页`HomeViewController`控制器中

`@interface HomeViewController : BaseViewController`继承的是`BaseViewController`不是`UIViewController`

`BaseViewController`
`@interface BaseViewController : UIViewController`再继承`UIViewControlle`


![Snip20160629_12.png](http://upload-images.jianshu.io/upload_images/1754828-66df960ba91c2481.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


```
- (void)viewDidLoad {
[super viewDidLoad];

[self setupTitleView];

[self setupSearchItem];

[self setupMainView];

RegisterNotify(loginStatusChangeNotification, @selector(loginStatusChange));

[self loginStatusChange];
}
```


![Snip20160629_13.png](http://upload-images.jianshu.io/upload_images/1754828-c459ceedfc52eda4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


- 头部中间有一个 `*周一*   ~   *周日*`
- 在首页的UpdateViewController里面初始话

```
- (instancetype)initWithFrame:(CGRect)frame
{
self = [super initWithFrame:frame];
if (self) {
self.backgroundColor = [UIColor whiteColor];
[self setupNavigationHeadView];

}
return self;
}

static const CGFloat navigationHeadView_H = 35;

- (void)layoutSubviews {
[super layoutSubviews];

self.navigationHeadView.frame = CGRectMake(0, 0,self.width,navigationHeadView_H);
self.cartoonListView.frame = CGRectMake(0, navigationHeadView_H, self.width, self.height - navigationHeadView_H);
}
```

```
- (void)setupNavigationHeadView {

NSMutableArray *weekArray = [NSMutableArray arrayWithArray:
@[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"]];

NSInteger week = [[DateManager share] currentWeek] - 1;

NSMutableArray *arr = [NSMutableArray array];

for (NSInteger index = 6; index > 1; index--) {

NSInteger newWeek = week - index;

if (newWeek < 0) newWeek = 7 + newWeek;

[arr addObject:weekArray[newWeek]];
}

[arr addObjectsFromArray:@[@"昨天",@"今天"]];

```
###`FindingsViewController`发现页面


![Snip20160629_17.png](http://upload-images.jianshu.io/upload_images/1754828-b2e733cdcac4679f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 发现页面有点难度，作者也是痛苦了很久，不知道怎么完成，到处百度，实现了效果就行，代码搬家方法，导航栏就不介绍了，重点是`MainView`

```
#pragma mark 设置tableview为主要视图

static NSString * const RenQiBiaoShengCellIdentifier    = @"RenQiBiaoShengCell";
static NSString * const MeiZhouPaiHangCellIdentifier    = @"MeiZhouPaiHangCell";
static NSString * const XinZuoCellIdentifier            = @"XinZuoCell";
static NSString * const ZhuBianLiTuiCellIdentifier      = @"ZhuBianLiTuiCell";
static NSString * const GuanFangHuoDongCellIdentifier   = @"GuanFangHuoDongCell";

- (void)setupMainView {

weakself(self);

UITableView *mainView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

mainView.dataSource = self;
mainView.delegate   = self;
mainView.backgroundColor = [UIColor whiteColor];
mainView.separatorStyle  = UITableViewCellSeparatorStyleNone;

[mainView registerClass:[RenQiBiaoShengCell class]  forCellReuseIdentifier:RenQiBiaoShengCellIdentifier];       //人气飙升
[mainView registerClass:[MeiZhouPaiHangCell class]  forCellReuseIdentifier:MeiZhouPaiHangCellIdentifier];       //每周排行榜
[mainView registerClass:[XinZuoCell class]          forCellReuseIdentifier:XinZuoCellIdentifier];               //新作出炉
[mainView registerClass:[ZhuBianLiTuiCell class]    forCellReuseIdentifier:ZhuBianLiTuiCellIdentifier];         //主播力推
[mainView registerClass:[GuanFangHuoDongCell class] forCellReuseIdentifier:GuanFangHuoDongCellIdentifier];      //官方活动

MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
[weakSelf requestDataWithCachingPolicy:ModelDataCachingPolicyReload];
}];

[normalHeader.arrowView setImage:[UIImage imageNamed:@"ic_pull_refresh_arrow_22x22_"]];

mainView.mj_header = normalHeader;

[self.view addSubview:mainView];

self.mainView = mainView;

[self setupPicScrollView];
}
```

![Snip20160629_18.png](http://upload-images.jianshu.io/upload_images/1754828-a77ab22de876872e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20160629_19.png](http://upload-images.jianshu.io/upload_images/1754828-1cf0879943b80b9a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


![Snip20160629_20.png](http://upload-images.jianshu.io/upload_images/1754828-5eb5eebc6ef5f2f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 英语不好，全都用中文来命名

```
#pragma mark tableView的代理方法


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

NSString *Identifier = nil;

switch (indexPath.section) {
case 0:Identifier = RenQiBiaoShengCellIdentifier;break;      //人气飙升
case 1:Identifier = MeiZhouPaiHangCellIdentifier;break;      //每周排行榜
case 2:Identifier = XinZuoCellIdentifier;break;              //新作出炉
case 3:Identifier = ZhuBianLiTuiCellIdentifier;break;        //主播力推
case 4:Identifier = GuanFangHuoDongCellIdentifier;break;     //官方活动
}

UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];

if ([cell isKindOfClass:[MeiZhouPaiHangCell class]]) {
MeiZhouPaiHangCell *mzph = (MeiZhouPaiHangCell *)cell;
if (mzph.itemOnClick == nil) {

weakself(self);

[mzph setItemOnClick:^(NSInteger index) {

topicInfoModel *md =  weakSelf.modelArray[1];
topicModel *topic = md.topics[index];

WordsDetailViewController *wdVc = [WordsDetailViewController new];
wdVc.wordsID = topic.ID.stringValue;

[weakSelf.navigationController pushViewController:wdVc animated:YES];

}];
}
}

cell.selectionStyle = UITableViewCellSelectionStyleNone;

topicInfoModel *md = [self.modelArray objectAtIndex:indexPath.section];

if (indexPath.section == 4) {
[cell performSelector:@selector(setTopics:) withObject:md.banners];
}else {
[cell performSelector:@selector(setTopics:) withObject:md.topics];
}

return cell;
}
```

- tableView的代理方法很多，高度，cell之间的间距，等等，这里不介绍了


##个人中心
- 个人中心是用故事版做的这个比较简答，没有代码，全都是画的
`PersonalCenter.storyboard`
后期的下伙伴们可以在个人中心增加内容。我这里也会慢慢增加

##结束语
还有很多的东西都没有介绍，简简单单的一篇文章不够说，这里偷个懒，公共页面下个月在做介绍，文章也更新

- 下载地址[醉看红尘这场梦](https://github.com/qijinliang/CarWorkspace)(<-点击就行)


![Snip20160629_21.png](http://upload-images.jianshu.io/upload_images/1754828-2c0182233ea558d4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 也可以直接点击我的主页查看所有项目