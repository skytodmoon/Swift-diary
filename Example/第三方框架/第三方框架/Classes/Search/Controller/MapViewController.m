//
//  MapViewController.m
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "MapViewController.h"
#import "PrefixHeader.pch"

@interface MapViewController ()<MAMapViewDelegate,AMapSearchDelegate>
{
    MAMapView * _mapView;
    AMapSearchAPI * _search;
    AMapLocationManager * _locationManager;
    NSString * _position;
}

@end

@implementation MapViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initNav];
    [self setupNav];
    [self searchPosition];
    [self creatAmapView];
    [self getCurrentPositionInfo];
    // Do any additional setup after loading the view.
}

-(void)setupNav{

    self.view.backgroundColor = navigationBarColor;
    
    //设置导航栏内容
    self.navigationItem.title = @"地图";
    //导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationButtonReturn" highImage:@"navigationButtonReturnClick" target:self action:@selector(tagButtonClick)];
}


//-(void)initNav{
//    //创建一个导航栏
//    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screen_width, 66)];
//    //把导航栏集合添加到导航栏中，设置动画关闭，设置颜色
//    [navBar pushNavigationItem:[self navItem] animated:NO];
//    //设置NavigationBar背景颜色
//    [[UINavigationBar appearance] setBarTintColor:RGBA(26,198,180,1)];
//    [self.view addSubview:navBar];
//
//}
//
//-(UINavigationItem *)navItem{
//    // 创建一个导航项
//    UINavigationItem *navigationItem = [[UINavigationItem alloc]
//                                        initWithTitle:@"地图"];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    
//    // 创建一个左边边按钮
//    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,44,22)];
//    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
//    [leftButton addTarget:self action:@selector(aboutback)forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
//    [navigationItem setLeftBarButtonItem:leftItem];
//    
//    return navigationItem;
//    
//}

-(void)aboutback{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma  mark -------------------根据经纬度搜索周围信息-------------------------
-(void)searchPosition{
    
    //搜索地址获得地址附近信息

    _search = [[AMapSearchAPI alloc] init];
    _search.delegate = self;
    [self ahah];
    
}



//实现POI搜索对应的回调函数
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if(response.pois.count == 0)
    {
        return;
    }
    
    //通过 AMapPOISearchResponse 对象处理搜索结果
    //NSString *strCount = [NSString stringWithFormat:@"count: %ld",response.count];
    //NSString *strSuggestion = [NSString stringWithFormat:@"Suggestion: %@", response.suggestion];
    NSString *strPoi = @"";
    for (AMapPOI *p in response.pois) {
        strPoi = [NSString stringWithFormat:@"%@\nPOI: %@", strPoi, p.description];
        NSLog(@"%@*%@*%@",p.description,p.name,p.address);
    }
}

#pragma mark ------------------------地图的创建---------------------------
-(void)creatAmapView{
    
    //地图

    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 66, screen_width, screen_height)];
    _mapView.delegate = self;
    //设置定位精度
    _mapView.desiredAccuracy = kCLLocationAccuracyBest;
    //设置定位距离
    _mapView.distanceFilter = 5.0f;
    _mapView.zoomEnabled = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    //普通样式
    _mapView.mapType = MAMapTypeStandard;
    //地图跟着位置移动
    [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    //设置成NO表示关闭指南针；YES表示显示指南针
    _mapView.showsCompass= NO;
    //设置指南针位置
    _mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22);
    //设置成NO表示不显示比例尺；YES表示显示比例尺
    _mapView.showsScale= NO;
    //设置比例尺位置
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);
    //缩放等级
    [_mapView setZoomLevel:16 animated:YES];
    //开启定位
    _mapView.showsUserLocation = YES;
    [self.view addSubview:_mapView];
    
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
//    if(updatingLocation)
//    {
////        取出当前位置的坐标
//        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
//    }
    _locationManager = [userLocation.location copy];
    
}

#pragma mark 定位用户进行地理编码查询
-(void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view{

    if ([view.annotation isKindOfClass:[MAUserLocation class]]) {
        [self initAction];
    };
}

-(void)initAction{
    if (_locationManager) {
        AMapReGeocodeSearchRequest *request = [[AMapReGeocodeSearchRequest alloc]init];
//        request.location = [AMapGeoPoint locationWithLatitude:_locationManager longitude:_locationManager];
        [_search AMapReGoecodeSearch:request];
        
    }
}

-(void)ahah{
    
    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];
    
    request.location = [AMapGeoPoint locationWithLatitude:26.063184 longitude:119.298224];
    request.keywords = _position;
    // types属性表示限定搜索POI的类别，默认为：餐饮服务|商务住宅|生活服务
    // POI的类型共分为20种大类别，分别为：
    // 汽车服务|汽车销售|汽车维修|摩托车服务|餐饮服务|购物服务|生活服务|体育休闲服务|
    // 医疗保健服务|住宿服务|风景名胜|商务住宅|政府机构及社会团体|科教文化服务|
    // 交通设施服务|金融保险服务|公司企业|道路附属设施|地名地址信息|公共设施
    request.types = @"餐饮服务|生活服务|商务住宅";
    request.sortrule = 0;
    request.radius = 700;
    request.requireExtension = YES;
    
    //发起周边搜索
    [_search AMapPOIAroundSearch: request];
}
#pragma mark -----------------获得当前位置信息城市 区 街道-------------------------


-(void)getCurrentPositionInfo{
    
    _locationManager = [[AMapLocationManager alloc] init];
    [_locationManager setDistanceFilter:kCLLocationAccuracyKilometer];
    [self getCurrentAddress];
}
//获取当前位置信息
-(void)getCurrentAddress{
    
    [_locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error) {
            NSLog(@"获取当前地址错误");
            return;
        }
        NSMutableDictionary *addressDic = [NSMutableDictionary dictionary];
        [addressDic setValue:regeocode.province forKey:@"province"];
                [addressDic setValue:regeocode.city forKey:@"city"];
                [addressDic setValue:regeocode.district forKey:@"district"];
        NSString * position = [NSString stringWithFormat:@"%@%@%@%@",regeocode.city,regeocode.district,regeocode.street,regeocode.number];
        _position = position;
        
        //city 市 district 区 street 街道 number  街道号码
        NSLog(@"%@%@%@%@",regeocode.city,regeocode.district,regeocode.street,regeocode.number);
    }];
    
}

#pragma mark --------点击地图得到点击点的坐标------------------


//点击地图获得该点击地点的经纬度
-(void)mapView:(MAMapView *)mapView didSingleTappedAtCoordinate:(CLLocationCoordinate2D)coordinate{
    
    NSLog(@"%f,%f",coordinate.latitude,coordinate.longitude);
    
    
}

@end
