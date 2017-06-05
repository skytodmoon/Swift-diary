//
//  RecommendCell.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomGroup.h"

@class Room;
typedef void (^PlayBlock)(Room *room);

@interface RecommendCell : UITableViewCell
/**
 *  创给cell的数据
 */
@property (nonatomic,strong) NSArray *rooms;

/**
 *  额外自己加的一个来判断颜值分组的属性
 */
@property (nonatomic,copy) NSString *groupName;

@property (nonatomic,copy) PlayBlock block;
@end
