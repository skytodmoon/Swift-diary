//
//  UserInfo.h
//  第三方框架
//
//  Created by 金亮齐 on 2017/3/14.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfo : NSObject
@property (nonatomic,strong)NSDictionary *checkin;
@property (nonatomic,copy)NSString *user_id;
@property (nonatomic,copy)NSString *im_user_id;
@property (nonatomic,copy)NSString *username;
@property (nonatomic,copy)NSString *gender;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,copy)NSString *cover;
@property (nonatomic,copy)NSString *map;
@property (nonatomic,copy)NSString *follow_status;
@property (nonatomic,copy)NSString *fans;
@property (nonatomic,copy)NSString *follow;
@property (nonatomic,copy)NSString *cities;
@property (nonatomic,copy)NSString *countries;
@property (nonatomic,copy)NSString *pois;
@property (nonatomic,copy)NSString *trips;
@property (nonatomic,copy)NSString *together_city;
@property (nonatomic,copy)NSString *together_city_total;
@property (nonatomic,copy)NSString *together_country_total;
@property (nonatomic,copy)NSString *wants;
@property (nonatomic,copy)NSString *want_counties;
@property (nonatomic,copy)NSString *want_cities;
@property (nonatomic,copy)NSString *plan_url;
@end
