//
//  RoomGroup.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoomGroup : NSObject

@property (nonatomic,copy) NSString *groupName;

@property (nonatomic,copy) NSString *groupImage;

@property (nonatomic,strong) NSArray *rooms;

@property (nonatomic,assign) CGFloat cellHeight;

@end
