//
//  Header.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#ifndef Header_h
#define Header_h
#import "UITextField+Shake.h"

#define APIKEY @"5aed7f0e8121d1d985e3344f98ca5955";

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)

#define navigationBarColor RGB(67, 199, 176)
#define separaterColor RGB(200, 199, 204)
#define selectColor RGB(46, 158, 138)

//个人中心颜色
#define kDKBlurredBackgroundDefaultLevel 0.9f
#define kDKBlurredBackgroundDefaultGlassLevel 0.2f
#define kDKBlurredBackgroundDefaultGlassColor [UIColor whiteColor]


// 3.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 4.屏幕大小尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

//重新设定view的Y值
#define setFrameY(view, newY) view.frame = CGRectMake(view.frame.origin.x, newY, view.frame.size.width, view.frame.size.height)
#define setFrameX(view, newX) view.frame = CGRectMake(newX, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define setFrameH(view, newH) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, newH)


//取view的坐标及长宽
#define W(view)    view.frame.size.width
#define H(view)    view.frame.size.height
#define X(view)    view.frame.origin.x
#define Y(view)    view.frame.origin.y

//5.常用对象
#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

//6.经纬度
#define LATITUDE_DEFAULT 39.983497
#define LONGITUDE_DEFAULT 116.318042

//设置我的头像的高度
#define topViewHeight 272

//7.
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]


#define UID @"4597633"
#define VERSION @"2.4.1.2"
//友盟Appkey
#define UMAPPKEY @"56022d7ae0f55a91380030ff"


#endif /* Header_h */
