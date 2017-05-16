//
//  UItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UItem : NSObject

/************ u ************/

//头像数组
@property (nonatomic,strong) NSArray *header;

//是否是会员
@property (nonatomic,assign,getter=isVip) BOOL is_v;

//名字
@property (nonatomic,strong) NSString *name;

//性别
@property (nonatomic,strong) NSString *sex;

/************ image ************/

//大图
@property (nonatomic,strong) NSArray *big;

//下载的URL
@property (nonatomic,strong) NSArray *download_url;

//高度
@property (nonatomic,assign) NSInteger height;

//中图
@property (nonatomic,strong) NSArray *medium;

//小图
@property (nonatomic,strong) NSArray *small;

//宽度
@property (nonatomic,assign) NSInteger width;



@end
