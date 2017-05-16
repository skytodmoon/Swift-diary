//
//  AudioItem.h
//  百思不得姐(oc)
//
//  Created by 金亮齐 on 2017/5/16.
//  Copyright © 2017年 醉看红尘这场梦. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AudioItem : NSObject


//URL
@property (nonatomic,strong) NSArray *download_url;

//时间
@property (nonatomic,assign) NSInteger duration;

//高度
@property (nonatomic,assign) NSInteger height;

//播放次数
@property (nonatomic,assign) NSInteger playcount;

//专辑图片
@property (nonatomic,strong) NSArray *thumbnail;

//宽度
@property (nonatomic,assign) NSInteger width;
@end
