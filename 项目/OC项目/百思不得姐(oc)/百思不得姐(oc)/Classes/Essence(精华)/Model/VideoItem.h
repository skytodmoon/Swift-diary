//
//  VideoItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoItem : NSObject

@property (nonatomic,strong) NSArray *download;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,assign) NSInteger playcount;
@property (nonatomic,strong) NSArray *video;
@property (nonatomic,assign) NSInteger duration;
@property (nonatomic,strong) NSArray *thumbnail;
@end
