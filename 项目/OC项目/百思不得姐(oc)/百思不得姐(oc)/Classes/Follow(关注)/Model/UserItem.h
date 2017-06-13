//
//  UserItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserItem : NSObject
@property (nonatomic,strong) NSString *header;
@property (nonatomic,assign) NSInteger fans_count;
@property (nonatomic,strong) NSString *screen_name;
@property (nonatomic,assign,getter=isVip) BOOL is_vip;
@end
