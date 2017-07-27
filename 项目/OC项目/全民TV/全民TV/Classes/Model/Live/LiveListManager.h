//
//  LiveListManager.h
//  全民TV
//
//  Created by 金亮齐 on 2017/7/27.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LIVELIST_MANAGER  [LiveListManager share]

@interface LiveListManager : NSObject

/** 列表数据 */
@property (nonatomic, strong) NSMutableArray *liveListData;

/** 单列 */
+ (LiveListManager*)share;

/** 请求数据 */
- (void)requestLiveListData:(DataParseBlock)block;

@end
