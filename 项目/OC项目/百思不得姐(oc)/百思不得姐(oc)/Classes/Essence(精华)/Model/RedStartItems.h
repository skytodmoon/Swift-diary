//
//  RedStartItems.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HeaderItems;
@interface RedStartItems : NSObject

//头像
@property (nonatomic,strong) HeaderItems *header;

//名字
@property (nonatomic,strong) NSString *name;

//是否VIP
@property (nonatomic,assign,getter=isVip) BOOL jie_v;

//简介
@property (nonatomic,strong) NSString *introduction;
@end
