//
//  LiveCollectionViewController.h
//  斗鱼(OC)
//
//  Created by 金亮齐 on 2017/6/2.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "CollectionViewCell.h"
#import "FaceCollectionViewCell.h"

typedef enum {
    LiveCellTypeNormal,
    LiveCellTypeFaceLevel
} LiveCellType;

@interface LiveCollectionViewController : UICollectionViewController

@property (nonatomic,assign) LiveCellType cellType;

@property (nonatomic,strong) NSMutableArray *rooms;

@property (nonatomic,assign) int ofset;

@property (nonatomic,copy) NSString *lastUrl;

@end
