//
//  QJLUser.h
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/12.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QJLUser : NSObject
/** 用户名*/
@property (nonatomic, copy) NSString *username;
/** 性别*/
@property (nonatomic, copy) NSString *sex;
/** 头像*/
@property (nonatomic, copy) NSString *profile_image;

@end
