//
//  likeCountView.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface likeCountView : UIButton

@property (nonatomic) BOOL islike;                  //当前状态

@property (nonatomic,copy) NSString *requestID;     //点赞请求ID

@property (nonatomic) NSInteger  likeCount;         //设置赞数

@property (nonatomic,copy) void (^onClick)(likeCountView *btn);


+ (instancetype)likeCountViewWithCount:(NSInteger)count requestID:(NSString *)ID;

@end
