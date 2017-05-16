//
//  TopCommentItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UItem,UserItems;
@interface TopCommentItem : NSObject

//ID
@property (nonatomic,strong) NSString *ID;

//评论内容
@property (nonatomic,strong) NSString *content;

//点赞数
@property (nonatomic,strong) NSString *like_count;


//声音时间
@property (nonatomic,assign) NSNumber *voicetime;

//U模型
@property (nonatomic,strong) UItem *u;

//user模型
@property (nonatomic,strong) UserItems *user;

@end
