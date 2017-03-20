//
//  NetManager.m
//  日日煮
//
//  Created by 金亮齐 on 2017/3/20.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import "NetManager.h"
#import "PrefixHeader.pch"

@implementation NetManager

+ (id)getMessagerFormThePage:(NSInteger)page CompletionHandler:(void (^)(MenuModel *, NSError *))completionHandler{

    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(page) forKey:@"currentPage"];
    [dic setValue:@(20) forKey:@"pageSize"];
    [dic setValue:@"" forKey:@"name"];
    [dic setValue:@"" forKey:@"categoryId"];
    [dic setValue:@"" forKey:@"parentId"];
    [dic setValue:@"" forKey:@"screeningId"];
    [dic setValue:@"" forKey:@"tagId"];
    [dic setValue:@"" forKey:@"username"];
    [dic setValue:@"" forKey:@"password"];
    
    return [self GET:kDayDayCookPath parameters:dic progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MenuModel parseJSON:jsonObject],error);
    }];
}
+ (id)postDataFormThePage:(NSInteger)page Key:(NSString *)key CompletionHandler:(void (^)(MenuModel *, NSError *))completionHandler{
    NSString *str_key = [NSString stringWithCString:[key UTF8String] encoding:NSUTF8StringEncoding];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(page) forKey:@"currentPage"];
    [dic setValue:@(20) forKey:@"pageSize"];
    [dic setValue:str_key forKey:@"name"];
    [dic setValue:@"" forKey:@"categoryId"];
    [dic setValue:@"" forKey:@"parentId"];
    [dic setValue:@"" forKey:@"screeningId"];
    [dic setValue:@"" forKey:@"tagId"];
    [dic setValue:@"" forKey:@"username"];
    [dic setValue:@"" forKey:@"password"];
    return [self POST:kDayDayCookPath parameters:dic progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MenuModel parseJSON:jsonObject],error);
    }];
}


@end
