//
//  NetManager.h
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrefixHeader.pch"

@interface NetManager : NSObject

+ (id)getMessagerFormThePage:(NSInteger)page CompletionHandler:(void(^)(MenuModel *model, NSError *error))completionHandler;
+ (id)postDataFormThePage:(NSInteger)page Key:(NSString *)key CompletionHandler:(void(^)(MenuModel *model, NSError *error))completionHandler;

@end
