//
//  AuthorInfoModel.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseModel.h"
#import "topicModel.h"



@interface AuthorInfoModel : BaseModel

@property (nonatomic,copy)   NSString *avatar_url;

@property (nonatomic,strong) NSNumber *bind_phone;

@property (nonatomic,strong) NSNumber *follower_cnt; //粉丝个数

@property (nonatomic,assign) BOOL      following; //是否关注

@property (nonatomic,strong) NSNumber *grade;

@property (nonatomic,strong) NSNumber *ID;

@property (nonatomic,copy)   NSString *intro;

@property (nonatomic,copy)   NSString *u_intro;

@property (nonatomic,copy)   NSString *ios;

@property (nonatomic,copy)   NSString *nickname;

@property (nonatomic,strong) NSNumber *pub_feed;

@property (nonatomic,copy)   NSString *reg_type;

@property (nonatomic,copy)   NSString *site;

@property (nonatomic,strong) NSArray  *topics;

@property (nonatomic,strong) NSNumber *update_remind_flag;

@property (nonatomic,copy)   NSString *wechat;

@property (nonatomic,copy)   NSString *weibo_name;


@end
