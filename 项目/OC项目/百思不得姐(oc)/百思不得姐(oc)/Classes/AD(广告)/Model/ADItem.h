//
//  ADItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//
//  从返回的数据中挑选有用的属性

#import <Foundation/Foundation.h>

@interface ADItem : NSObject

//当前广告图片URL
@property (nonatomic,strong) NSString *w_picurl;
//点击广告之后跳入的广告网址
@property (nonatomic,strong) NSString *ori_curl;
//广告图片的宽度
@property (nonatomic,assign) CGFloat w;
//广告图片的高度
@property (nonatomic,assign) CGFloat h;


@end
