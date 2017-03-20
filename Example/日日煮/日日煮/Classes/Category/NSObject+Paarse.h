//
//  NSObject+Paarse.h
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKit.h>
#import <NSObject+YYModel.h>
#import "Constan.h"

@interface NSObject (Paarse)<YYModel>

+ (id)parseJSON:(id)json;

@end
