//
//  User.h
//  微博(OC)
//
//  Created by 金亮齐 on 2017/5/11.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
/** 用户id */
@property (nonatomic, copy) NSString *idstr;
/** 用户头像 */
@property (nonatomic, copy) NSString *profile_image_url;
/** 用户昵称 */
@property (nonatomic, copy) NSString *name;
/** vip类型 */
@property (nonatomic, assign) int mbtype;
/** vip等级 */
@property (nonatomic, assign) int mbrank;
@end
