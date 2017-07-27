//
//  HttpClient.h
//  全民TV
//
//  Created by 金亮齐 on 2017/7/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

#define _NetWork   [HttpClient share]

/** http通讯成功的block */
typedef void (^HTTPRequestSuccessBlock)(id responseObject);
/** http通讯失败后的block */
typedef void (^HTTPRequestFailedBlock)(NSError *error);

/** 获取当前网络状态 */
typedef NS_ENUM(NSUInteger, NetworkStatus)
{
    /** 未知网络 */
    NetworkStatusUnknown           = 0,
    /** 没有网络 */
    NetworkStatusNotReachable,
    /** 2G/3G/4G 网络 */
    NetworkStatusReachableViaWWAN,
    /** wifi */
    NetworkStatusReachableViaWiFi
};

/** 定义请求类型的枚举 */
typedef NS_ENUM(NSUInteger, HttpRequestType)
{
    /** get请求 */
    HttpRequestTypeGet = 0,
    /** post请求 */
    HttpRequestTypePost
};

//超时时间
#define HTTP_TIMEOUT      10

@interface HttpClient : NSObject

/** 获取当前的网络状态 */
@property (nonatomic, assign) HttpRequestType   netWorkStatus;

/** 获得全局唯一的网络请求实例单例方法 */
+ (instancetype)share;


/**
 *  网络请求的实例方法
 *
 *  @param type         get / post (项目目前只支持这倆中)
 *  @param urlString    请求的地址
 *  @param parameters   请求的参数
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */
+ (void)requestWithType:(HttpRequestType)type
              UrlString:(NSString *)urlString
             Parameters:(NSDictionary *)parameters
           SuccessBlock:(HTTPRequestSuccessBlock)successBlock
           FailureBlock:(HTTPRequestFailedBlock)failureBlock;




@end
