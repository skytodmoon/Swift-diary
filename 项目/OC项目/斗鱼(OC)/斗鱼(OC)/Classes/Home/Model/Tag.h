//
//  RoomList.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"

@interface Tag : NSObject
/**
 *  这个房间组的所有房间
 */
@property (nonatomic,copy) NSArray *room_list;
/**
 *  标签名
 */
@property (nonatomic,copy) NSString *tag_name;
/**
 *  标签id
 */
@property (nonatomic,copy) NSString *tag_id;
/**
 *  该标签的图片
 */
@property (nonatomic,copy) NSString *icon_url;
/**
 *  push_vertical_screen
 */
@property (nonatomic,copy) NSString *push_vertical_screen;

@property (nonatomic,copy) NSString *short_name;

@property (nonatomic,copy) NSString *pic_name;

@property (nonatomic,copy) NSString *icon_name;

@property (nonatomic,copy) NSString *orderdisplay;
@property (nonatomic,copy) NSString *rank_score;
@property (nonatomic,copy) NSString *night_rank_score;
@property (nonatomic,copy) NSString *nums;

@property (nonatomic,copy) NSString *push_ios;
@property (nonatomic,copy) NSString *push_home;

@property (nonatomic,copy) NSString *is_game_cate;
@property (nonatomic,copy) NSString *cate_id;
@property (nonatomic,copy) NSString *is_del;
@property (nonatomic,copy) NSString *is_relate;
@property (nonatomic,copy) NSString *push_qqapp;
@property (nonatomic,copy) NSString *broadcast_limit;
@property (nonatomic,copy) NSString *pic_url;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *count;
@property (nonatomic,copy) NSString *count_ios;

@property (nonatomic,copy) NSString *groupImageName;

@end
