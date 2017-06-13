//
//  RecommendItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendItem : NSObject

//根据写出的Plish文件找出相应的数据进行定义

//头像的URL
@property (nonatomic,strong) NSString *image_list;

//关注的数量
@property (nonatomic,strong) NSString *sub_number;

//名字
@property (nonatomic,strong) NSString *theme_name;

//总帖数
@property (nonatomic,strong) NSString *post_num;
@end
