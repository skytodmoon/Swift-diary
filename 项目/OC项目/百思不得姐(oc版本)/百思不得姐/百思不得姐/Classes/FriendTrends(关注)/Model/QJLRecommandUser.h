//
//  QJLRecommandUser.h
//  百思不得姐
//
//  Created by 金亮齐 on 2016/12/9.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QJLRecommandUser : NSObject

/**
 *  头像
 */
@property (nonatomic, copy) NSString *header;
/**
 *  粉丝数
 */
@property (nonatomic, assign) NSInteger fans_count;
/**
 *  昵称
 */
@property (nonatomic, copy) NSString *screen_name;

@end
