//
//  NJKWebViewProgress.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#undef njk_weak
#if __has_feature(objc_arc_weak)
#define njk_weak weak
#else
#define njk_weak unsafe_unretained
#endif

extern const float NJKInitialProgressValue;
extern const float NJKInteractiveProgressValue;
extern const float NJKFinalProgressValue;

typedef void (^NJKWebViewProgressBlock)(float progress);
@protocol NJKWebViewProgressDelegate;
@interface NJKWebViewProgress : NSObject<UIWebViewDelegate>
@property (nonatomic, njk_weak) id<NJKWebViewProgressDelegate>progressDelegate;
@property (nonatomic, njk_weak) id<UIWebViewDelegate>webViewProxyDelegate;
@property (nonatomic, copy) NJKWebViewProgressBlock progressBlock;
@property (nonatomic, readonly) float progress; // 0.0..1.0

- (void)reset;
@end

@protocol NJKWebViewProgressDelegate <NSObject>
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress;
@end

