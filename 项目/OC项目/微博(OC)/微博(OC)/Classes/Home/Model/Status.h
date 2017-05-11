//
//  Status.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Status : NSObject

/** 原创微博id */
@property (nonatomic, copy) NSString *idstr;
/** 原创微博作者 */
@property (nonatomic, strong) User *user;
/** 原创微博时间 */
@property (nonatomic, copy) NSString *created_at;
/** 原创微博来源 */
@property (nonatomic, copy) NSString *source;
/** 原创微博正文 */
@property (nonatomic, copy) NSString *text;;
/** 原创微博配图 */
@property (nonatomic, strong) NSArray *pic_urls;

/** 被转发的微博 */
@property (nonatomic, strong) Status *retweeted_status ;

/** 微博转发数 */
@property (nonatomic, assign) int reposts_count;
/** 微博评论数 */
@property (nonatomic, assign) int comments_count;
/** 微博表态数 */
@property (nonatomic, assign) int attitudes_count ;

@end


