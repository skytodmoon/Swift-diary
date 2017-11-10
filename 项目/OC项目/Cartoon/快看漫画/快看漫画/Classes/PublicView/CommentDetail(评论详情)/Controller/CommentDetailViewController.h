//
//  CommentDetailViewController.h
//  快看漫画
//
//  Created by 金亮齐 on 2016/12/14.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "BaseViewController.h"
#import "UserInfoManager.h"

@interface CommentDetailViewController : BaseViewController

@property (nonatomic,copy)   NSNumber *dataRequstID;

@property (nonatomic,assign) commentDataType dataType;

+ (instancetype)showInVc:(UIViewController *)vc
        withDataRequstID:(NSNumber *)ID
            WithDataType:(commentDataType)dataType;

@end
