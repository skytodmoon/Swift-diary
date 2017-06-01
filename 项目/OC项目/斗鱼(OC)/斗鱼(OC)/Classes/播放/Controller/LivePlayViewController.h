//
//  LivePlayViewController.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/1.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LivePlayViewController : UIViewController

/***  直播的地址 */
@property (nonatomic,copy) NSString *liveUrl;

/***  是否锁屏 */
@property (nonatomic,assign,readonly) BOOL isLock;

@end
