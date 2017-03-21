//
//  BaseViewModel.h
//  日日煮
//
//  Created by 金亮齐 on 2017/3/21.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VMRequestMode) {
    VMRequestModeRefresh,
    VMRequestModeMore,
};

@interface BaseViewModel : NSObject{
    NSURLSessionDataTask *_dataTask;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) NSURLSessionDataTask *dataTask;

@end
