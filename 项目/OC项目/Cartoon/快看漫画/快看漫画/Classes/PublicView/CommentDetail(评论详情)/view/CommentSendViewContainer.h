//
//  CommentSendViewContainer.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoManager.h"

@class CommentsModel;

@protocol CommentSendViewContainerDelegate <NSObject>

@optional

- (void)sendMessageSucceeded:(CommentsModel *)commentContent;

@end


@interface CommentSendViewContainer : UIView

@property (nonatomic,strong) NSNumber *dataRequstID;

@property (nonatomic,weak) id<CommentSendViewContainerDelegate> delegate;

@property (nonatomic,assign) commentDataType dataType;


+ (instancetype)showInView:(UIView *)view;
- (instancetype)initInView:(UIView *)view;

+ (instancetype)showWithID:(NSNumber *)ID
              WithDataType:(commentDataType)dataType
                    inView:(UIView *)view;
- (instancetype)initWithID:(NSNumber *)ID
              WithDataType:(commentDataType)dataType
                    inView:(UIView *)view;

- (void)replyWithUserName:(NSString *)nickName commentID:(NSNumber *)ID;

@end
