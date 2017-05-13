//
//  QJLComment.h
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class QJLUser;

@interface QJLComment : NSObject
/** id*/
@property (nonatomic, copy) NSString *ID;
/** 音频文件的时长*/
@property (nonatomic, assign) NSInteger voicetime;
/** 音频文件的路径*/
@property (nonatomic, copy) NSString *voiceuri;
/** 评论的文字内容*/
@property (nonatomic, copy) NSString *content;
/** 被点赞的数量*/
@property (nonatomic, assign) NSInteger like_count;
/** 用户*/
@property (nonatomic, strong) QJLUser *user;

@end
